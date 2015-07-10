# Maintainer: Christian Rebischke <echo Q2hyaXMuUmViaXNjaGtlQGdtYWlsLmNvbQo= | base64 -d>

pkgname=peda-git
pkgver=45.d0bd978
pkgrel=2
pkgdesc="PEDA - Python Exploit Development Assistance for GDB"
arch=('any')
url="https://github.com/longld/peda"
license=('Creative Commons')
depends=( 'gdb' 'python2')
makedepends=('git')
source=('git+http://github.com/longld/peda')
md5sums=('SKIP')
install="peda.install"

pkgver() {
  cd peda
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
  install -D -m755 "${srcdir}/peda/peda.py" \
    "${pkgdir}/usr/share/peda/peda.py"
  install -D -m644 "${srcdir}/peda/LICENSE" \
    "${pkgdir}/usr/share/peda/LICENSE"
  install -D -m644 "${srcdir}/peda/README" \
    "${pkgdir}/usr/share/peda/README"
  install -D -m755 "${srcdir}/peda/lib/config.py" \
    "${pkgdir}/usr/share/peda/lib/config.py"
  install -D -m755 "${srcdir}/peda/lib/nasm.py" \
    "${pkgdir}/usr/share/peda/lib/nasm.py"
  install -D -m755 "${srcdir}/peda/lib/shellcode.py" \
    "${pkgdir}/usr/share/peda/lib/shellcode.py"
  install -D -m755 "${srcdir}/peda/lib/skeleton.py" \
    "${pkgdir}/usr/share/peda/lib/skeleton.py"
  install -D -m755 "${srcdir}/peda/lib/utils.py" \
    "${pkgdir}/usr/share/peda/lib/utils.py"


  
  
}


# vim:set ts=2 sts=2 sw=2 et
