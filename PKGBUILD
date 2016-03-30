# Maintainer: John Jenkins <twodopeshaggy@gmail.com>


_pkgname=googler
pkgname=googler-git
pkgver=r357.360caac
pkgrel=1
pkgdesc="Google Search from command line"
arch=('any')
url="https://github.com/jarun/googler"
license=('GPL3')
depends=('python')
makedepends=('git')
conflicts=('googler')
source=('git://github.com/jarun/googler.git')
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 googler "${pkgdir}/usr/bin/googler"
  install -Dm644 googler.1 "${pkgdir}/usr/share/man/man1/googler.1"
  install -Dm644 auto-completion/fish/googler.fish "${pkgdir}/usr/share/fish/vendor_completions.d/googler.fish"
  install -Dm644 auto-completion/bash/googler-completion.bash "${pkgdir}/etc/bash_completion.d/googler"
  install -Dm644 auto-completion/zsh/_googler "${pkgdir}/usr/share/zsh/site-functions/_googler"
}
