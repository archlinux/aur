# Maintainer: Castor <whoisyoges@castorisdead.xyz>
pkgname=local-arch-wiki
pkgver=2.0
pkgrel=1
pkgdesc="A convenient wrapper for arch-wiki-docs, enabling effortless searching and access to the offline Arch Wiki."
arch=('any')
url="https://github.com/whoisyoges/local-arch-wiki"
license=('GPL-2.0-or-later')
depends=('arch-wiki-docs' 'bash' 'sed')
optdepends=('dmenu: tofi, dmenu, rofi or any other menu.'
            'firefox: Firefox or any other web browser.'
            'libnotify: For notification support.')
makedepends=('git')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

package() {
  cd "${srcdir}/$pkgname"
  install -Dm755 local-arch-wiki "${pkgdir}/usr/local/bin/local-arch-wiki"
  install -Dm0644 -t "$pkgdir/usr/local/share/doc/$pkgname" README.md config.example
}
