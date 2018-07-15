# Maintainer: Quentin Bourgeois <quentin+archlinux@bourgeois.eu>

_commit_id=9136a9b737e0a5b6471a91571d104c487c43f35b
_upstream_pkgname=gitolite-emacs
pkgname=emacs-gitolite-mode
pkgver=0.3.1
pkgrel=2
pkgdesc='Emacs major mode for gitolite'
arch=('any')
url='https://github.com/llloret/gitolite-emacs'
depends=('emacs')
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/llloret/gitolite-emacs/archive/9136a9b737e0a5b6471a91571d104c487c43f35b.tar.gz")
sha256sums=('0e95624a8952288cab561af1334ea68c26d01be0b5546c4e1145a03a568a2385')

build() {
  cd "${_upstream_pkgname}-${_commit_id}"

  emacs -batch -f batch-byte-compile gl-conf-mode.el
}

package() {
  cd "${_upstream_pkgname}-${_commit_id}"

  install -Dm644 gl-conf-mode.el "${pkgdir}/usr/share/emacs/site-lisp/gl-conf-mode.el"
  install -Dm644 gl-conf-mode.elc "${pkgdir}/usr/share/emacs/site-lisp/gl-conf-mode.elc"
}
