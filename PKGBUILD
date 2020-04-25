# Maintainer: tioguda <guda.flavio@gmail.com>

_pkgname=ddutility
pkgname=ddutility-bin-pt-br
pkgver=1.6
pkgrel=1
pkgdesc="Gravar e fazer backup dos arquivos IMG e ISO do sistema operacional no cartão de memória ou no disco"
arch=('any')
license=('custom')
url="https://www.thefanclub.co.za/how-to/dd-utility-write-and-backup-operating-system-img-and-iso-files-memory-card-or-disk"
depends=('bash' 'coreutils' 'gzip' 'lsof' 'udevil' 'xz' 'zenity' 'zip')
conflicts=('ddutility-bin')
provides=('ddutility')
options=('!strip' '!emptydirs')
source=("https://raw.githubusercontent.com/thefanclub/dd-utility/master/DEB/${_pkgname}_${pkgver}_all.deb"
        'translation_pt-br.patch')
sha256sums=('bf01d8fc8fafaf76ab751fbcf6b54d75930581e62d602fcaf4cd28fe23579224'
            'de5c1fca6693f3b545ea5094a921fe67a3bbc43372f67992fee9bb06a8e26083')

package_ddutility-bin-pt-br() {
    # Extract package data
    tar xf data.tar.xz -C "${pkgdir}"

    cd "${pkgdir}"
    patch -p1 -i ${srcdir}/translation_pt-br.patch

    install -Dm644 "${pkgdir}/usr/share/doc/ddutility/copyright" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
