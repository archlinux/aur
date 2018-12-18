# http://rec.arts.int-fiction.narkive.com/pM8Kgfbw/confusion-just-enough-mdl

pkgname=confusion
pkgver=0.2
pkgrel=2
pkgdesc="A MDL interpreter"
arch=('x86_64')
provides=('confusion')
url='http://gitlab.com/emacsomancer/confusion-mdl'
license=('GPL')
source=("git+https://gitlab.com/emacsomancer/confusion-mdl.git")
md5sums=('SKIP')

package() {
    cd "${srcdir}"
    cd confusion-mdl

    make

    install -Dm755 mdli "${pkgdir}"/usr/bin/mdli
    ln -s /usr/bin/mdli "${pkgdir}"/usr/bin/confusion

    install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
