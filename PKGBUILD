# Maintainer:  Francesco Colista <fcolista@alpinelinux.org>
# Contributor: Christoph Zeiler <rabyte*gmail>

pkgname=arcadia
pkgver=1.1.1
pkgrel=0
pkgdesc="A light IDE for Ruby"
arch=('any')
url="http://arcadia.rubyforge.org/"
install=$pkgname.install
license=('RUBY')
depends=('ruby' 'ruby-coderay>1.0')
optdepends=('ctags: other languages support'
            'xterm: termina integration'
		    'ruby-debug: debug support')
source=(http://rubygems.org/downloads/$pkgname-$pkgver.gem)
md5sums=('d458d6208f229be446b6dcdbf1c127cd')
build() {
  cd "$srcdir"
}

package() {
  cd "$srcdir"
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install $pkgname-$pkgver.gem --ignore-dependencies -i "$pkgdir$_gemdir" --no-user-install -n "$pkgdir/usr/bin"
  ln -sf arc "$pkgdir/usr/bin/$pkgname"
}
