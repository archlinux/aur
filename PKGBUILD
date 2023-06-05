# Contributor: Hao Long <imlonghao@archlinuxcn.org>
# Contributor: Daniel M. Capella <polycitizen@gmail.com>
# Contributor: Asuka Minato

pkgname=gitleaks-bin
_pkgname=gitleaks
pkgver=8.16.3
pkgrel=1
pkgdesc='Audit Git repos for secrets and keys'
url=https://github.com/gitleaks/gitleaks
arch=('x86_64' 'i686' armv7h armv6h aarch64)
license=('MIT')
depends=()
makedepends=()
provides=($_pkgname)
source_x86_64=(https://github.com/gitleaks/gitleaks/releases/download/v"$pkgver"/gitleaks_"$pkgver"_linux_x64.tar.gz)
source_i686=(https://github.com/gitleaks/gitleaks/releases/download/v"$pkgver"/gitleaks_"$pkgver"_linux_x32.tar.gz)
source_armv7h=(https://github.com/gitleaks/gitleaks/releases/download/v"$pkgver"/gitleaks_"$pkgver"_linux_armv7.tar.gz)
source_armv6h=(https://github.com/gitleaks/gitleaks/releases/download/v"$pkgver"/gitleaks_"$pkgver"_linux_armv6.tar.gz)
source_aarch64=(https://github.com/gitleaks/gitleaks/releases/download/v"$pkgver"/gitleaks_"$pkgver"_linux_arm64.tar.gz)
b2sums_x86_64=('2c428c0a54f5d81331bca800aac4e8c5867867f955aead4a2fd0713ee9a9936377e3be36a275f6b4bca12dcac924b2e131fec99abd8f304e77cbdd7176d14399')
b2sums_i686=('5e41aa8deb0ee76c232b05a1fe95a00d4ebf7f6cb51d938709fbcdbff1347dcb06e1fa96c387ea28a35a8dbb614c2ff7c9f9f98385f6d4299be8865bc19145e5')
b2sums_armv7h=('914398f8edadb7543e3e6e87d325550d8b2c838d1d4b7e360fa59add211f59ff01d29e550f35a560507c39c385853689f1a0efbc414793ed133b5f32edeacdee')
b2sums_armv6h=('d0e709e6e57eb123d0f80fd1d7ce433027fe6e0b1414f680f543a4b0618422a017d5f1546868075329e5469cdf7ebddbbb37dbb88eee85e6caa974b1683ec365')
b2sums_aarch64=('d4c0ef815c4602597c4ef78366569a777f9fef814ac2e54a0df28e30c6d95aa1c01d86afbd8abe7580750e463d1df954bfa3da0001632c67ad4262cef1589a69')

package() {
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/"$pkgname"
  install -Dm755 "$_pkgname" "$pkgdir"/usr/bin/"$_pkgname"
  ./gitleaks completion bash --no-descriptions |
    install -Dm644 /dev/stdin "$pkgdir"/usr/share/bash-completion/completions/"$_pkgname"
  ./gitleaks completion zsh --no-descriptions |
    install -Dm644 /dev/stdin "$pkgdir"/usr/share/zsh/site-functions/_"$_pkgname"
  ./gitleaks completion fish --no-descriptions |
    install -Dm644 /dev/stdin "$pkgdir"/usr/share/fish/vendor_completions.d/"$_pkgname".fish
}

# vim:set ts=2 sw=2 et:

