pkgname=lidm
pkgver=0.0.1
pkgrel=1
depends=('pam')
pkgdesc="A fully colorful cutomizable TUI display manager made in C. (build latest tag)"
arch=('any')
url="https://github.com/javalsai/lidm"
license=('GPL')
provides=('lidm')
conflicts=('lidm-bin' 'lidm-git')
source=("lidm-repo::git+https://github.com/javalsai/lidm")
sha256sums=('SKIP')

build() {
    cd lidm-repo
    make CFLAGS="-O3"
}

package() {
    cd lidm-repo
    install -Dm755 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 lidm "${pkgdir}/usr/bin/lidm"
    install -Dm755 themes/default.ini "${pkgdir}/etc/lidm.ini"
}
