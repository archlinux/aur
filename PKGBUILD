# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ruby-github-markdown-preview
pkgver=4.0.1
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
sha256sums=('6455590e8aa2aa86a8e5731fe81347a91cdac035326dcc56f677d5661d9da477')
noextract=("${pkgname#*-}-${pkgver}.gem")
provides=('github-markdown-preview' 'ruby-github-markdown-preview')
conflicts=('github-markdown-preview')

package() {
  cd "$srcdir"

  msg2 'Installing...'
  gem install \
    --no-user-install \
    --ignore-dependencies \
    -i "$pkgdir$(ruby -rubygems -e'puts Gem.default_dir')" \
    ${pkgname#*-}-$pkgver.gem
}
