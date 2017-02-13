# Maintainer: Jonian Guveli <https://github.com/jonian/>
# Contributor Jonne Haß <me@jhass.eu>
pkgname=ruby1.9-bin
pkgver=1.9.3_p392
pkgrel=2
pkgdesc="An object-oriented language for quick and easy programming"
arch=("x86_64")
url="http://www.ruby-lang.org/en"
license=("BSD" "custom")
depends=("openssl" "libffi" "libyaml")
provides=("ruby1.9" "rubygems1.9" "rake1.9")
replaces=("ruby1.9")
source=("https://rvm_io.global.ssl.fastly.net/binaries/arch/libc-2.15/x86_64/ruby-${pkgver//_/-}.tar.bz2")
md5sums=("SKIP")

package() {
  mkdir -p "$pkgdir/opt"

  cp -a "$srcdir/ruby-${pkgver//_/-}" "$pkgdir/opt/ruby-${pkgver//_/-}"
  rm "$pkgdir/opt/ruby-${pkgver//_/-}/lib/ruby/gems/1.9.1"
  mkdir -p "$pkgdir/usr/bin"
  for name in erb gem irb rake rdoc ri ruby; do
    ln -sf "/opt/ruby-${pkgver//_/-}/bin/$name" "$pkgdir/usr/bin/$name-1.9"
  done
}

