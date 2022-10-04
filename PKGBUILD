# Maintainer: Alexander Chaplin Braz <contact@alexchaplinbraz.com>
pkgname='genrepass-bin'
_pkgname='genrepass'
pkgver=1.1.1
pkgrel=4
pkgdesc='Generate readable passwords from an ordered list of words extracted from text'
arch=('x86_64' 'i686')
url='https://github.com/AlexChaplinBraz/genrepass-cli'
license=('MIT')
depends=('libxcb' 'gcc-libs' 'glibc')
conflicts=('genrepass' 'genrepass-git')
source_x86_64=("$url/releases/download/$pkgver/$_pkgname-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_i686=("$url/releases/download/$pkgver/$_pkgname-$pkgver-i686-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('3e9d9cf0083a77b73f94c2a5992fa7f2be0c303eac6b998f7299bac40e1960bd')
sha256sums_i686=('4cef7612fd24033daac08630f03e083c853eff337f831d5485d515b92e4ee552')

package() {
	if [ $(uname -m) == "x86_64" ]; then
		install -Dm644 "$srcdir/$_pkgname-$pkgver-x86_64-unknown-linux-gnu/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
		install -Dm755 "$srcdir/$_pkgname-$pkgver-x86_64-unknown-linux-gnu/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	else
		install -Dm644 "$srcdir/$_pkgname-$pkgver-i686-unknown-linux-gnu/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
		install -Dm755 "$srcdir/$_pkgname-$pkgver-i686-unknown-linux-gnu/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	fi
}
