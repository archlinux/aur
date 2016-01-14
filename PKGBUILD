# Maintainer: heapifyman <heapifyman@gmail.com>
pkgname=maven-bash-completion-git
pkgdesc="Bash completion script for maven"
pkgver=r160.e27e290
pkgrel=1
arch=('any')
url="https://github.com/juven/maven-bash-completion"
license=('APACHE')
depends=('maven'
         'bash-completion')
makedepends=('git')
source=("$pkgname::git+https://github.com/juven/maven-bash-completion.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -m 0644 -D "${srcdir}"/"$pkgname"/bash_completion.bash "${pkgdir}"/usr/share/bash-completion/completions/mvn
}
