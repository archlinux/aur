# Maintainer: tioguda  <guda.flavio@gmail.com>
# Contributor: barnabedikartola

pkgbase=bigbashview
pkgname=${pkgbase}
_pkgver=3.8.1
pkgver=3.8.1_r486.a11017c
pkgrel=1
arch=('any')
license=('GPL')
url="https://github.com/biglinux/${pkgbase}"
pkgdesc="BigBashView is a python app to run Bash+HTML in a Desktop WebView"
makedepends=('git')
source=("git+https://github.com/biglinux/${pkgbase}.git")
sha512sums=('SKIP')

pkgver() {
    cd ${srcdir}/${pkgbase}
    printf "${_pkgver}_r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    depends=('pyside6' 'python-six' 'webkit2gtk-4.1' 'qt6-webengine' 'ttf-lato'
                    'python-setproctitle' 'python-webpy' 'bbv-framework')
    provides=("${pkgbase}=${_pkgver}")

    mkdir -p "${pkgdir}"/usr/{bin,lib/bbv,share}
    cp -r "${srcdir}/${pkgbase}/${pkgbase}"/usr/* "${pkgdir}/usr/"
}
