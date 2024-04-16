# Maintainer: Wryn (yage) Wagner yage@yage.io
pkgname='scwrypts'
pkgver=4.3.1
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

sha256sums=('531d6584a19dc67a7007e0e02f314a88b09dbfd0a38869761a764c5efb3a636c')
