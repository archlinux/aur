# Maintainer: Grey Christoforo <grey@christoforo.net>

_gemname=gollum
pkgname=ruby-$_gemname
pkgver=4.1.1
pkgrel=2
pkgdesc='A simple, Git-powered wiki.'
arch=(any)
url='http://github.com/gollum/gollum'
license=(MIT)
depends=(ruby ruby-gollum-lib ruby-kramdown ruby-sinatra ruby-mustache ruby-useragent)
options=(!emptydirs)
source=(ttps://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha256sums=('fa70f19bb0e43a239d672bc9a38b79a8bc9bed344fc80794dfefa68b3c742a4b'
            '87a9bb1e8a508bd3ef3eecff0f593ed4a122cc7fcbae6b5d147d020db0c38509'
            '23e3c3bf8406d5268c9dc108b12cf69ceccc00d50190d70b0dcfe09dd52b68d6'
            '6b195107e6a3a44a7b35c25e3680299c382c2b50324635c09f934406bedd2cd3'
            '5c60cd85db3df6b279e9a6807954c596dc0ced359a10fcd9b49969a6aa8d7d40'
            'c3be075f5b38a1b02404be5778b181e50fba9ab253bac851cb217d9a71375b77'
            '458619a49aed401b8e9e4c2c1589f98b98b0887dbd78781bd6be78d68c872b48'
            '54287608f4399006ae5549f009053d2029ad75bf462dc70203c116580ac0d867'
            '4ae4a74f555008ecc541060515c37baa9e16f131538447a668c0bf52117c43b7'
            '826a96db895819c13fffa4fa3c20b85e80b60aaec1f28f79e7db80092abdb0bc')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"

  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem

  rm -rf "$pkgdir/$_gemdir/cache"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('fa70f19bb0e43a239d672bc9a38b79a8bc9bed344fc80794dfefa68b3c742a4b')
