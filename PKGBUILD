# Maintainer: heapifyman <heapifyman@gmail.com>
pkgname=completion-ruby-git
pkgdesc="a set of bash scripts offering command-line completion for various Ruby-related commands and tools"
pkgver=r112.f3e4345
pkgrel=1
arch=('any')
url="https://github.com/mernen/${pkgname%-git}"
license=('MIT')
depends=('ruby'
         'bash-completion')
makedepends=('git')
source=("git://github.com/mernen/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -m 0644 -D "${srcdir}/${pkgname%-git}"/completion-bundle "${pkgdir}"/usr/share/bash-completion/completions/bundle
    install -m 0644 -D "${srcdir}/${pkgname%-git}"/completion-gem "${pkgdir}"/usr/share/bash-completion/completions/gem
    install -m 0644 -D "${srcdir}/${pkgname%-git}"/completion-jruby "${pkgdir}"/usr/share/bash-completion/completions/jruby
    install -m 0644 -D "${srcdir}/${pkgname%-git}"/completion-rails "${pkgdir}"/usr/share/bash-completion/completions/rails
    install -m 0644 -D "${srcdir}/${pkgname%-git}"/completion-rake "${pkgdir}"/usr/share/bash-completion/completions/rake
    install -m 0644 -D "${srcdir}/${pkgname%-git}"/completion-ruby "${pkgdir}"/usr/share/bash-completion/completions/ruby
}
