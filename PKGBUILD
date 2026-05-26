# Maintainer: farwayer <farwayer@gmail.com>
# Maintainer: Axel Navarro <navarroaxel at Gmail>

pkgname=fastlane
pkgver=2.235.0
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
sha512sums=('e88578129eb522ac6fc686b16f194e3e4c022714f41df43ad2e5c7065664bc9e045cca9559102491254a1b6027f763620eb7d0b574cf9f82830e5273e1a50faa'
  '396618e9e1644d7710fc31c7385cdfd62e9282f397f3e6fe1615b79d08be6fc0f79d71473a280ecf22a61b23e3f0ce4d9062e19dfd9883ea1e77b76c3a49421c')

package() {
  gem install --no-user-install --no-document -i "$pkgdir/opt/fastlane" fastlane-$pkgver.gem
  rm -r "$pkgdir/opt/fastlane/cache"
  install -Dm755 fastlane -t "$pkgdir/usr/bin"
  install -Dm644 "$pkgdir/opt/fastlane/gems/fastlane-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/fastlane"
}
