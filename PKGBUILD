# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ruby-github-markdown-preview
pkgver=4.0.0
pkgrel=1
pkgdesc="Local previews for Github Flavored Markdown files"
arch=('any')
depends=('ruby'
         'ruby-gemoji'
         'ruby-github-markdown'
         'ruby-html-pipeline'
         'ruby-json'
         'ruby-listen'
         'ruby-sanitize')
optdepends=('ruby-github-linguist: enable syntax highlighting for code blocks')
url="https://github.com/dmarcotte/github-markdown-preview"
license=('MIT')
source=(https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem)
sha256sums=('653ad9270c99f91aa21f9b9bf7f8148fc868c0a78087ec60e2ccaefc8d4352f7')
noextract=("${pkgname#*-}-${pkgver}.gem")
provides=('github-markdown-preview' 'ruby-github-markdown-preview')
conflicts=('github-markdown-preview')

package() {
  cd "$srcdir"

  msg 'Installing...'
  gem install \
    --no-user-install \
    --ignore-dependencies \
    -i "$pkgdir$(ruby -rubygems -e'puts Gem.default_dir')" \
    ${pkgname#*-}-$pkgver.gem
}
