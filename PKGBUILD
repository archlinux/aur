# Maintainer: farawayer <farwayer@gmail.com>

_gemname=fastlane
pkgname=$_gemname
pkgver=2.137.0
pkgrel=1
pkgdesc='The easiest way to automate beta deployments and releases for your iOS and Android apps'
arch=(any)
url='https://fastlane.tools'
license=(MIT)
depends=(
  ruby
  'ruby-addressable>=2.3' 'ruby-addressable<3'
  'ruby-babosa>=1.0.2' 'ruby-babosa<2'
  'ruby-bundler>=1.12' 'ruby-bundler<3'
  'ruby-cfpropertylist>=2.3' 'ruby-cfpropertylist<4'
  ruby-colored
  'ruby-commander-fastlane>=4.4.6' 'ruby-commander-fastlane<5'
  'ruby-dotenv>=2.1.1' 'ruby-dotenv<3'
  'ruby-emoji_regex>=0.1' 'ruby-emoji_regex<2'
  'ruby-excon>=0.45' 'ruby-excon<1'
  # 'ruby-faraday<0.16'
  ruby-faraday-fastlane
  'ruby-faraday-cookie_jar>=0.0.6' 'ruby-faraday-cookie_jar<0.1'
  'ruby-faraday-middleware>=0.13.1' 'ruby-faraday-middleware<0.14'
  'ruby-fastimage>=2.1' 'ruby-fastimage<3'
  'ruby-gh_inspector>=1.1.2' 'ruby-gh_inspector<2'
  'ruby-google-api-client>=0.21.2' 'ruby-google-api-client<0.24'
  'ruby-google-cloud-storage>=1.15' 'ruby-google-cloud-storage<2'
  # 'ruby-highline<2' 'ruby-highline>=1.7.2'
  ruby-highline-1
  'ruby-json<3'
  # 'ruby-jwt>=2.1' 'ruby-jwt<2.2'
  ruby-jwt-2.1
  # 'ruby-mini_magick>=4.9.4' 'ruby-mini_magicl<5'
  ruby-mini_magick-4
  # 'ruby-multipart-post>=2' 'ruby-multipart-post<2.1'
  ruby-multipart-post-2.0
  'ruby-multi_xml>=0.5' 'ruby-multi_xml<1'
  'ruby-plist>=3.1' 'ruby-plist<4'
  # 'ruby-public_suffix>=2' 'ruby-public_suffix<2.1'
  ruby-public_suffix-2
  # 'ruby-rubyzip>=1.3' 'ruby-rubyzip<2'
  ruby-rubyzip-1
  'ruby-security=0.1.3'
  'ruby-simctl>=1.6.3' 'ruby-simctl<1.7'
  'ruby-slack-notifier>=2' 'ruby-slack-notifier<3'
  'ruby-terminal-notifier>=2' 'ruby-terminal-notifier<3'
  'ruby-terminal-table>=1.4.5' 'ruby-terminal-table<2'
  'ruby-tty-screen>=0.6.3' 'ruby-tty-screen<1'
  'ruby-tty-spinner>=0.8' 'ruby-tty-spinner<1'
  'ruby-word_wrap>=1' 'ruby-word_wrap<1.1'
  'ruby-xcodeproj>=1.6' 'ruby-xcodeproj<2'
  'ruby-xcpretty>=0.3' 'ruby-xcpretty<0.4'
  'ruby-xcpretty-travis-formatter>=0.0.3'
)
makedepends=(ruby-rdoc)
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
sha1sums=('299bb9a9ab22a47989ba64dc8e03e9f1a7c37d9c')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
