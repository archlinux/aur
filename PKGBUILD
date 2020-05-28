# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Daichi Shinozaki <dsdseg@gmail.com>

pkgname=teamocil
pkgver=1.4.2
pkgrel=2
pkgdesc='set up window and splits layouts for tmux using YAML configuration files'
arch=('any')
url='https://github.com/remi/teamocil'
license=('MIT')
depends=('ruby' 'tmux')
makedepends=('rubygems' 'ruby-rdoc')
source=("https://rubygems.org/downloads/$pkgname-$pkgver.gem")
sha256sums=('221bf0b600e0a277c98befbecea8a454ee87dbd1c7e8767a2f64dda8dc18aed0')
noextract=("${source[@]##*/}")

package() {
    local _gemdir="$(ruby -rrubygems -e'puts Gem.default_dir')"
    gem install --no-user-install --ignore-dependencies --verbose \
        -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" "${source[@]##*/}"
}
