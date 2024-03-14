# Maintainer: Wryn (yage) Wagner yage@yage.io
pkgname='scwrypts'
pkgver=4.1.5
pkgrel=1
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
	ripgrep
	git
	sed
	zsh
	)

optdepends=(
	'aws-cli: AWS-CLI-v2 support'
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
	ln -s "/usr/share/scwrypts/scwrypts" "$pkgdir/usr/bin/scwrypts"
}

sha256sums=('bd236de6a637b33abe6731ae7ab75db4b78d0910738e18d0b82ea38a207e55b3')
