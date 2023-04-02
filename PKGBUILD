# Maintainer: gls <ghostlovescorebg at gmail dot com>

pkgname=goenv-git
pkgver=r1724.0cbe222
pkgrel=1
pkgdesc="Like pyenv and rbenv, but for Go."
arch=('i686' 'x86_64')
url="https://github.com/syndbg/goenv"
license=('MIT')
source=("git+https://github.com/syndbg/goenv.git")
makedepends=('git')
options=('!libtool' 'docs' 'strip')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%%-git}"

  # Get the version number.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${pkgname%%-git}"

  for file in $(ls -1 libexec/); do
    install -D -m755 libexec/${file} "${pkgdir}/usr/lib/goenv/libexec/${file}"
  done

}
