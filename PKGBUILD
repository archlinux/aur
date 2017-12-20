# Maintainer: Noel Maersk <veox plus packages the veox toad pw>

pkgname=emacs-lll-mode-git
pkgver=v0.1.0.r0.gdecc55c
pkgrel=1
pkgdesc='An emacs major mode for editing Ethereum LLL code'
arch=('x86_64')
url='https://github.com/robmyers/lll-mode'
license=('GPLv3')
makedepends=('git')
depends=('emacs')
install=${pkgname}.install
provides=('emacs-lll-mode')
conflicts=('emacs-lll-mode')
source=("$pkgname"::'git+https://gitlab.com/veox/emacs-lll-mode.git')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  # cutting off 'v-' prefix that presents in the git tag
  git describe --long | sed 's/^v-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p $pkgdir/usr/share/emacs/site-lisp/lll-mode
  install -Dm644 *.el $pkgdir/usr/share/emacs/site-lisp/lll-mode
}
