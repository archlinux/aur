# Maintainer: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=git-image-merge-git
pkgver=r6.6e25058
pkgrel=1
pkgdesc='Simple visual diff and merging tool for images'
arch=('x86_64' 'i686')
url='https://github.com/sandsmark/git-image-merge'
license=('GPL3')
depends=('qt5-base')
makedepends=('git')
conflicts=(git-image-merge)
provides=(git-image-merge)
source=('git+https://github.com/sandsmark/git-image-merge.git')
md5sums=('SKIP')

pkgver() {
    cd git-image-merge
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd git-image-merge
    qmake
    make
}


package() {
    cd git-image-merge
    install -Dm 755 git-image-merge "${pkgdir}/usr/bin/git-image-merge"
    install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -vDm 644 install.sh -t "${pkgdir}/usr/share/doc/${pkgname}"
}
