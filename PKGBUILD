# Maintainer: lmartinez-mirror
# Contributor: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>
_pkgname=sslsecure.vim
pkgname=vim-sslsecure
pkgver=1.1.1
pkgrel=1
pkgdesc='Highlights insecure SSL configuration in Vim'
arch=('any')
url='https://github.com/chr4/sslsecure.vim'
license=('GPL3')
depends=('vim-plugin-runtime')
groups=('vim-plugins')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha512sums=('7dd43b57af566e3f96e0fd6076a0c86cf572d25c9f0db0bdd2f64004bf91a3a738d22adfd516e74c317140e4b36dde9d229d4d02ca7909a8b1d1690b0fa0cbb9')

package() {
  cd "$_pkgname-$pkgver"
  find plugin \
    -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}

# vim:set et sw=2 ts=2 tw=79:
