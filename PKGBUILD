# Maintainer: farwayer <farwayer@gmail.com>
# Maintainer: Axel Navarro <navarroaxel at Gmail>

pkgname=fastlane
pkgver=2.238.0
pkgrel=1
pkgdesc='The easiest way to automate beta deployments and releases for your iOS and Android apps'
arch=(any)
url='https://fastlane.tools'
license=(MIT)
depends=(ruby ruby-abbrev ruby-erb)
makedepends=(ruby-rake make gcc)
options=(!emptydirs)
source=(
  https://rubygems.org/downloads/fastlane-$pkgver.gem
  fastlane
)
noextract=(fastlane-$pkgver.gem)
sha512sums=('e009e210571608267d8a83befd9801b51e6878b7fd7fb477b6c3e829df9ae5a2e0c803a86ef5f324b572220cd74cc6e76ea2cc36c4116a9876b52396ba30495a'
  '396618e9e1644d7710fc31c7385cdfd62e9282f397f3e6fe1615b79d08be6fc0f79d71473a280ecf22a61b23e3f0ce4d9062e19dfd9883ea1e77b76c3a49421c')

package() {
  gem install --no-user-install --no-document -i "$pkgdir/opt/fastlane" fastlane-$pkgver.gem
  rm -r "$pkgdir/opt/fastlane/cache"
  install -Dm755 fastlane -t "$pkgdir/usr/bin"
  install -Dm644 "$pkgdir/opt/fastlane/gems/fastlane-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/fastlane"
}
