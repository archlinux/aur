# Maintainer: Dennis Stengele <dennis@stengele.me>
pkgname=ansible-doc-generator
pkgver=0.1.0
pkgrel=1
pkgdesc="CLI for documenting Ansible roles into Markdown files."
arch=("any")
url="https://github.com/PopulateTools/ansible-doc-generator"
license=('MIT')
depends=("ruby")
provides=("${pkgname%}")
conflicts=("${pkgname%}")
source=("https://rubygems.org/downloads/ansible_doc_generator-${pkgver}.gem")
sha256sums=('cbdf93a5b7c5aa3736496be642fc40bae3588c9110929a768850849136c0b1d2')

package() {
    local _gemdir="$(ruby -e 'puts Gem.default_dir')"
    gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" ansible_doc_generator-$pkgver.gem
    rm "$pkgdir/$_gemdir/cache/ansible_doc_generator-$pkgver.gem"
}
