# Maintainer: tioguda <guda.flavio@gmail.com>

_pkgname=ddutility
pkgname=ddutility-bin-pt-br
pkgver=1.5
pkgrel=1
pkgdesc="Gravar e fazer backup dos arquivos IMG e ISO do sistema operacional no cartão de memória ou no disco"
arch=('any')
license=('custom')
url="https://www.thefanclub.co.za/how-to/dd-utility-write-and-backup-operating-system-img-and-iso-files-memory-card-or-disk"
depends=('lsof' 'udevil' 'gksu' 'xz' 'coreutils' 'bash' 'gzip' 'zip' 'zenity')
conflicts=('ddutility-bin')
provides=('ddutility')
source=("https://raw.githubusercontent.com/thefanclub/dd-utility/master/DEB/${_pkgname}_${pkgver}_all.deb"
        'translation_pt-br.patch')
sha256sums=('49417d46f41550ef1346670269f7d08be499ef4127fca99d762dfb90942ce445'
            '8063e165853a79c342e472e973a25c70a2de82071277f221bc82c0b4f73b06fa')

prepare() {
	tar -xJf data.tar.xz
	patch -p1 -i ./translation_pt-br.patch
}

package_ddutility-bin-pt-br() {
	cd "$srcdir"
	# dump usr files to /usr
	mv usr "$pkgdir"
	# dump opt files to /opt
	mv opt "$pkgdir"
}
