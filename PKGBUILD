# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=jfrog-cli-bin
_pkgname=jfrog-cli
pkgver=1.46.4
pkgrel=1
pkgdesc="Simple interface to Artifactory, Bintray and Mission Control"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/jfrog/jfrog-cli"
license=('Apache')
depends=('glibc')
conflicts=('jfrog-cli' 'jfrog-cli-go')
provides=('jfrog-cli')

source=("$pkgname-$pkgver-$pkgrel.LICENSE::https://raw.githubusercontent.com/jfrog/$_pkgname/v$pkgver/LICENSE")

source_x86_64=("$pkgname-$pkgver-$pkgrel.jfrog::https://releases.jfrog.io/artifactory/$_pkgname/v1/$pkgver/$_pkgname-linux-amd64/jfrog")
source_i686=("$pkgname-$pkgver-$pkgrel.jfrog::https://releases.jfrog.io/artifactory/$_pkgname/v1/$pkgver/$_pkgname-linux-386/jfrog")
source_armv7h=("$pkgname-$pkgver-$pkgrel.jfrog::https://releases.jfrog.io/artifactory/$_pkgname/v1/$pkgver/$_pkgname-linux-arm/jfrog")
source_aarch64=("$pkgname-$pkgver-$pkgrel.jfrog::https://releases.jfrog.io/artifactory/$_pkgname/v1/$pkgver/$_pkgname-linux-arm64/jfrog")

noextract=("$pkgname-$pkgver-$pkgrel.LICENSE" "$pkgname-$pkgver-$pkgrel.jfrog")

sha512sums=('71d2b28a4d77cabaeb07b0d8622404aa5738f1e22fe48f6d4ad1c5d1f191dc3c7efc0d471a1ae3618d75862379162157cabf3abf8c21c4d3b7154a1dfa99cfa8')
sha512sums_x86_64=('fac30b6aa560db02ad5db97f0f6f3cbefdcb9072d089537da67c0b8829b90f3ef2430d651613e7079151c1607529128f7cc827cee84dac39d4731a49d4d98dff')
sha512sums_i868=('6683467181eac3a441fd92ad0cb6200b6e9e4613bbce28ea8c7330b0a7fef64fa34a4a6b6404efc04d026f944402cad87c302794a0a4ddec9248ae07036c8611')
sha512sums_armv7h=('3ea34e380ea0842d4948b5c6e853f6430b792575fb31435d08660df7d32ece3ec736b09560c1526ee58b3a58e37acd78bfc668f5abe09a86a4be2f8a0502d9d8')
sha512sums_aarch64=('b94236c27279c57fecf334fe9ebefac7cef3f8204f4836473796726061158aa385e1dd8c5843383524ae7c6d5aa4c5ed658d8258257b8e89df43555a1cdded6b')

package() {
  install -Dm755 "$pkgname-$pkgver-$pkgrel.jfrog" "$pkgdir/usr/bin/jfrog"
  install -Dm644 "$pkgname-$pkgver-$pkgrel.LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
