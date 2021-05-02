# Contributor: Rizwan Hasan <rizwan.hasan486@gmail.com>

pkgname=hugo-extended
pkgver=0.83.0
pkgrel=1
pkgdesc="Hugo is one of the most popular open-source static site generators. With its amazing speed and flexibility, Hugo makes building websites fun again."
arch=('x86_64')
url="https://gohugo.io/"
license=('Apache v2.0')
conflicts=('hugo' 'hugo-git')
source=("https://github.com/gohugoio/hugo/releases/download/v${pkgver}/hugo_extended_${pkgver}_Linux-64bit.tar.gz")
sha256sums=("84e2ef0a17f72261999d494b22ae24fa2cf9da4d6b2d524dba21b3ed0ed7004c")

package() {
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/opt/hugo"

    cp -avr "hugo" "${pkgdir}/opt/hugo"
    cp -avr "LICENSE" "${pkgdir}/opt/hugo"
    cp -avr "README.md" "${pkgdir}/opt/hugo"
    
    ln -sv "/opt/hugo/hugo" "${pkgdir}/usr/bin/hugo"
}
