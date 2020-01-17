# Maintainer: tioguda <guda.flavio@gmail.com>

_pkgname=ddutility
pkgname=ddutility-bin
pkgver=1.5
pkgrel=2
pkgdesc="Write and Backup Operating System IMG and ISO files on Memory Card or Disk"
arch=('any')
license=('custom')
url="https://www.thefanclub.co.za/how-to/dd-utility-write-and-backup-operating-system-img-and-iso-files-memory-card-or-disk"
depends=('lsof' 'udevil' 'gksu' 'xz' 'coreutils' 'bash' 'gzip' 'zip' 'zenity')
conflicts=('ddutility-bin-pt-br')
provides=('ddutility')
source=("https://raw.githubusercontent.com/thefanclub/dd-utility/master/DEB/${_pkgname}_${pkgver}_all.deb"
        'fix.patch')
sha256sums=('49417d46f41550ef1346670269f7d08be499ef4127fca99d762dfb90942ce445'
            'cb60afa451c48b139599d166a318e937291635864120ad1be8aa7e3c758a719b')

prepare() {
	tar -xJf data.tar.xz
	patch -p1 -i ./fix.patch
}

package_ddutility-bin() {
	cd "$srcdir"
	# dump usr files to /usr
	mv usr "$pkgdir"
	# dump opt files to /opt
	mv opt "$pkgdir"
}
