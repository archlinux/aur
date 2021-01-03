# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=cobaltstrike_brute-git
_pkgname=cobaltstrike_brute
pkgver=r8.f26eeea
pkgrel=1
pkgdesc="Cobalt Strike Team Server Password Brute Forcer"
arch=('any')
url="https://github.com/isafe/cobaltstrike_brute"
license=('Apache')
depends=('python' 'python-pyopenssl')
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/isafe/cobaltstrike_brute.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"	
  # Git, no tags available
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${_pkgname}"
  install -Dm755 cs_brute.py "${pkgdir}/usr/bin/cs_brute.py"
}
