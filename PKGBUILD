# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname='artemis'
pkgver='16.0.0'
pkgrel=1
pkgdesc='Artemis is a free genome viewer and annotation tool that allows visualization of sequence features and the results of analyses within the context of the sequence, and its six-frame translation.'
arch=('i686' 'x86_64')
url=http://www.sanger.ac.uk/resources/software/"${artemis}"
license=('GPL2')
depends=('java-runtime>=1.6')
provides=('artemis')
conflicts=('artemis')
source=(ftp://ftp.sanger.ac.uk/pub/resources/software/"${pkgname}"/"${pkgname}".tar.gz)
md5sums=('bf6d9d9df113b8676857e3eb3dedd990')

package() {
    cd "${srcdir}"/"${pkgname}"

    mkdir -p "${pkgdir}"/usr/bin
    mkdir -p "${pkgdir}"/opt/"${pkgname}"/

    cp -a * "${pkgdir}"/opt/"${pkgname}"/

    scripts=('act' 'art' 'dnaplotter')

    for script in "${scripts[@]}"
    do
        ln -s "${pkgdir}"/opt/artemis/"${script}" "${pkgdir}"/usr/bin/"${script}"
    done

    install -Dm644 README "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
