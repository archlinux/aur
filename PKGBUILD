# Maintainer: Mikel Pintado <mikelaitornube2010@gmail.com>

pkgname=recultis
pkgver=2.1.0
pkgrel=1
pkgdesc="Return to the cult games. On Linux, with modern, open source engines. Requires the multilib repository to be enabled."
arch=('x86_64')
url="https://makson.gitlab.io/Recultis/"
license=('GPL3')
install=recultis.install
depends=('python' 'python-pyqt5' 'xorg-server' 'binutils' 'mesa' 'openal')
    optdepends=('dpkg: alternative to ar.')
    makedepends=('lib32-glibc' 'lib32-libstdc++5')
    source=(
    https://gitlab.com/makson/Recultis/-/archive/v${pkgver}/Recultis-v${pkgver}.tar.gz
    recultis.desktop
)
md5sums=(
    '229a1d7a13e4fb3fe976fcff60ac8c24'
    '2aa3806d1cdfdaa2513cf777405a8512'
)

package()   {
    mv Recultis-v${pkgver} Recultis
    mkdir opt
    mv Recultis opt
    cp --preserve=mode -r opt "${pkgdir}"

    find "${pkgdir}" -type d -exec chmod 755 {} +

    mkdir -p ${pkgdir}/usr/share/applications
    cp --preserve=mode ${srcdir}/recultis.desktop ${pkgdir}/usr/share/applications

    rm -rf ${pkgdir}/opt/Recultis/{recultis.desktop,_layouts,.gitignore,LICENSE,index.md,README.md,_sass,_config.yml,Gemfile,assets/css,assets/design,assets/favicon.png,assets/icon.xcf}
}

