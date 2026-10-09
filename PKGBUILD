# Maintainer: Egor3f <ef@efprojects.com>

pkgname=vivaldi-theme-sync-patch
pkgver=1.0.1
pkgrel=1
pkgdesc='Patch for Vivaldi that fixes dark/light theme switch mode "Operating system"'
url='https://aur.archlinux.org/packages/vivaldi-theme-sync-patch'
arch=('any')
license=('MIT')
depends=('bash')
optdepends=('vivaldi: patched on install/upgrade'
            'vivaldi-snapshot: patched on install/upgrade')
source=('os-theme-sync.js'
        "$pkgname"
        "$pkgname.hook"
        "$pkgname-revert.hook"
        'LICENSE')
sha256sums=('e0a35159ba2b9a5a92cc39bce1fd4ff515a894f7e6e66918c42e8c7c26e1d5d2'
            '1e5cb79e8010abe30dcd996b5cad8a6d9cf026729bc284b55192ab20379ba599'
            'cd3a22f86a9950b59347ddaceaf000f745fe8c6e40cf4f976eb8d8b5b491bcbf'
            'd3eec62bafa87a27e3f92af17172cbd90b0559fc2f5a8d6560f24a9e0518fbea'
            '508a77d2e7b51d98adeed32648ad124b7b30241a8e70b2e72c99f92d8e5874d1')

package() {
  install -Dm644 os-theme-sync.js "$pkgdir/usr/share/$pkgname/os-theme-sync.js"
  install -Dm755 "$pkgname" "$pkgdir/usr/share/libalpm/scripts/$pkgname"
  install -Dm644 "$pkgname.hook" "$pkgdir/usr/share/libalpm/hooks/$pkgname.hook"
  install -Dm644 "$pkgname-revert.hook" "$pkgdir/usr/share/libalpm/hooks/$pkgname-revert.hook"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
