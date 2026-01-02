#
# PKGBUILD for unlzx
#
# Maintainer: amiga <t.scheller@email.de>
#

pkgname=unlzx
pkgver=1.1
pkgrel=1
epoch=
pkgdesc="Unlzx - decompresses LZX archives on multiple platforms"
arch=('any')
url="http://aminet.net/package/misc/unix/unlzx.c"
license=('UNKNOWN')
makedepends=('gcc')
depends=()
checkdepends=()
provides=('unlzx')

source=('http://aminet.net/misc/unix/unlzx.c.gz'
        'unlzx.patch')
sha256sums=('3cfd5dfe34482f91b6fbfc6a5fdd44c7454ce4867061e99cda8aaba628208f7d'
            'd17336aa2b89236cdd3879deb187583e480e48f080b9dc0be6735ad5468ef608')

prepare()
{
  patch -p1 < unlzx.patch
}

build()
{
  gcc -o unlzx unlzx.c
}

package()
{
  install -D -m755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
