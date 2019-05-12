# Maintainer: maelstor <maelstor at posteo dot de>

pkgname=gradle-bash-completion
pkgdesc="Bash completion for Gradle"
pkgver=1.4.1
pkgrel=1
arch=("any")
url="https://github.com/gradle/gradle-completion"
license=("MIT")
makedepends=('git')
depends=("bash-completion" "gradle")
source=('git+https://github.com/gradle/gradle-completion.git')
md5sums=('SKIP')

package() {
	cd gradle-completion || return 1
	git checkout "v$pkgver" >/dev/null 2>&1 || return 1

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 gradle-completion.bash \
		"$pkgdir/usr/share/bash-completion/completions/gradle"
}

