# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ruby-github-markdown-preview
pkgver=3.1.4
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
url="https://github.com/dmarcotte/github-markdown-preview"
license=('MIT')
source=(https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem)
sha256sums=('31a43eb026876e7f151095ab42c2992cf5afb1526fdc312917478a36d040915d')
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
