# Maintainer: farwayer <farwayer@gmail.com>
# Maintainer: Axel Navarro <navarroaxel at Gmail>

pkgname=fastlane
pkgver=2.242.0
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
sha512sums=('ccb1ddf024335fa0ac3efadad3dc6990534fb834c6a63ea0c2cc42152a9c8f528d18c70cf5c591642de70fdc95658e3f380edf0910c99c8db6a0f972fb9d6d74'
            '396618e9e1644d7710fc31c7385cdfd62e9282f397f3e6fe1615b79d08be6fc0f79d71473a280ecf22a61b23e3f0ce4d9062e19dfd9883ea1e77b76c3a49421c')

package() {
  gem install --no-user-install --no-document -i "$pkgdir/opt/fastlane" fastlane-$pkgver.gem
  rm -r "$pkgdir/opt/fastlane/cache"
  install -Dm755 fastlane -t "$pkgdir/usr/bin"
  install -Dm644 "$pkgdir/opt/fastlane/gems/fastlane-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/fastlane"
}
