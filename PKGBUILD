# Maintainer: farwayer <farwayer@gmail.com>
# Maintainer: Axel Navarro <navarroaxel at Gmail>

pkgname=fastlane
pkgver=2.231.1
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
sha256sums=('e268d9e90ce951a08e7711881718f4fe4469fbf0a640cc27dfabe957dea9c424'
            'feb1a15a8120dd3de709d73287fd4a754dbbfb05fa839f4927b3b7d6ea9b5ee3')

package() {
  gem install --no-user-install --no-document -i "$pkgdir/opt/fastlane" fastlane-$pkgver.gem
  rm -r "$pkgdir/opt/fastlane/cache"
  install -Dm755 fastlane -t "$pkgdir/usr/bin"
  install -Dm644 "$pkgdir/opt/fastlane/gems/fastlane-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/fastlane"
}
