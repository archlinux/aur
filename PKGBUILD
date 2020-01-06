# Maintainer Amin Wang <lagunawang@gmail.com>

pkgname=mdr
pkgver=0.2.2
pkgrel=1
pkgdesc="A standalone Markdown renderer for the terminal."
arch=('x86_64' 'i686')
url="https://github.com/MichaelMure/mdr"
license=('MIT')
depends=('glibc')
makedepends=('wget')

prepare() {
    arch_name=''
    case $arch in
    "x86_64")
        arch_name='amd64'
    ;;
    "i686")
        arch_name='i386'
    ;;
    esac

    url="https://github.com/MichaelMure/mdr/releases/download/v$pkgver/mdr_linux_$arch_name"
    wget "$url" -O mdr
    chmod +x mdr
}

package() {
    mkdir -p ${pkgdir}/usr/bin/
    cp ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}

#vim: syntax=sh
