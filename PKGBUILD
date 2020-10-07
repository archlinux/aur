# Maintainer: Tomasz Zok <tomasz.zok [at] gmail.com>
pkgname=easy-pandoc-templates-git
pkgver=r52.6d9c95a
pkgrel=1
pkgdesc="A collection of portable pandoc templates with no dependencies"
arch=(any)
url="https://github.com/ryangrose/easy-pandoc-templates"
license=('GPL')
depends=('pandoc')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/ryangrose/easy-pandoc-templates.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/${pkgname%-git}"
    install -d "$pkgdir/usr/share/pandoc/data/templates"
    install -t "$pkgdir/usr/share/pandoc/data/templates" html/*
}
