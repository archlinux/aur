# Maintainer: Samuel Littley <aur@toastwaffle.com>
pkgname=bigv-client
pkgver=0.9.2
pkgrel=1
pkgdesc="Management client for the BigV VM system."
arch=('any')
url="http://www.bigv.io/"
license=('GPL')
depends=('ruby>=1.8.6' 'ruby-json' 'openssh' 'ruby-highline' 'kdebindings-qtruby')
optdepends=('tightvnc: Admin console support')
source=(http://client.bigv.io/tgz/bigv_0.9.2-1946.tgz)
md5sums=('e00ec8936c89a3e21fe4939db7d37453')

build() {
  cd "$srcdir/bigv_0.9.2-1946"

  ruby ./setup.rb config
  ruby ./setup.rb setup
}

package() {
  cd "$srcdir/bigv_0.9.2-1946"

  ruby ./setup.rb install --prefix="$pkgdir/"
}
