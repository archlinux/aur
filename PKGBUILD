# Maintainer: Wryn (yage) Wagner yage@yage.io
pkgname='scwrypts'
pkgver=4.4.4
pkgrel=2
pkgdesc='devops script runner for local and CI'
url='https://github.com/wrynegade/scwrypts.git'
license=('GPL-3.0-or-later')
arch=('any')
source=(
	"https://github.com/wrynegade/scwrypts/archive/refs/tags/v$pkgver.tar.gz"
)


depends=(
	findutils
	coreutils
	fzf
	gawk
	go-yq
	grep
	jq
	jo
	ripgrep
	git
	sed
	zsh
	)

optdepends=(
	'aws-cli-v2: AWS-CLI-v2 support'
	'docker: docker container utilities'
	'ffmpeg: video compression utilities'
	'helm: helm chart development'
	'make: arbitrary package build support'
	'libnotify: desktop notification support'
	'python: python scwrypts support'
	'nodejs: javascript scwrypts support'
	'npm: javascript scwrypts support'
	'pnpm: javascript scwrypts support'
	'texlive-bin: LaTeX template support'
	'postgresql-libs: postgresql support'
	'redis: redis support for cache and utilities'
	'yamllint: helm chart development'
	)

package() {
	mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/share/"
	cp -r "$srcdir/scwrypts-$pkgver" "$pkgdir/usr/share/scwrypts"
	echo "v$pkgver" > "$pkgdir/usr/share/scwrypts/VERSION"
	echo "aur" > "$pkgdir/usr/share/scwrypts/MANAGED_BY"
	ln -s "/usr/share/scwrypts/scwrypts" "$pkgdir/usr/bin/scwrypts"
}

sha256sums=('4f0c08e57ede9e7a92638afd2609bf0ab15ad10df7a92575169ddec4ef90a416')
