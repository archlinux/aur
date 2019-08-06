# Maintainer: Tom Meyers tom@pbfp.team
pkgname=readme-generator-git
pkgver=1
pkgrel=1
pkgdesc="A basic tool to generate modern readme's"
arch=(any)
url="https://github.com/F0xedb/README-generator"
reponame="README-generator"
license=('GPL')

source=(
"git+https://github.com/F0xedb/README-generator.git")
md5sums=('SKIP')


prepare() {
    chmod +x "$reponame/"readme-gen # Make sure our package is executable
}

build() {
    return 0;
}


package() {
    mkdir -p "$pkgdir"/usr/bin
    mkdir -p "$pkgdir"/var/cache/readme
    cp "$reponame"/readme-gen "$pkgdir"/usr/bin
    cp "$reponame"/demo "$pkgdir"/var/cache/readme/demo
}
