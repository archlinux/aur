# Maintainer: farwayer <farwayer@gmail.com>
# Maintainer: Axel Navarro <navarroaxel at Gmail>

pkgname=fastlane
pkgver=2.236.1
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
sha512sums=('6fe01f1b42dfde67409318ec1078e7da31ba3427da52ad2cbe91776f8fd5122a706ff58313ee933df494793ae60b1af14e31e484c80fd0e46c1454fd636806ed'
  '396618e9e1644d7710fc31c7385cdfd62e9282f397f3e6fe1615b79d08be6fc0f79d71473a280ecf22a61b23e3f0ce4d9062e19dfd9883ea1e77b76c3a49421c')

package() {
  gem install --no-user-install --no-document -i "$pkgdir/opt/fastlane" fastlane-$pkgver.gem
  rm -r "$pkgdir/opt/fastlane/cache"
  install -Dm755 fastlane -t "$pkgdir/usr/bin"
  install -Dm644 "$pkgdir/opt/fastlane/gems/fastlane-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/fastlane"
}
