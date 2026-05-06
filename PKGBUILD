# Original Maintainer: Carson Rueter <roachh at proton mail dot com>
# Original Maintainer: Icelk <main at icelk.dev>
# Previous Maintainer: Marcus Behrendt <marcus dot behrendt dot 86 at bigbrother(gmail) dot com>
# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=vscodium-marketplace
pkgver=1.116.02821
pkgrel=1
pkgdesc='Enable vscode marketplace in vscodium'
arch=('any')
url='https://marketplace.visualstudio.com/vscode'
license=('unknown')
depends=('vscodium' 'python')
provides=("$pkgname")
conflicts=(
  vscodium-all-marketplace
  vscodium-bin-marketplace
  vscodium-electron-marketplace
  vscodium-electron-bin-marketplace
  vscodium-git-marketplace
  vscodium-insiders-marketplace
  vscodium-insiders-bin-marketplace
  vscodium-translucent-marketplace
)
install="$pkgname.install"
source=("$pkgname.hook"
        'patch.py')
sha512sums=('7a441ccba1c39f4ca1eeeecd9c1c434ac478bcebe0666d45bfd860ef47e6e4f8f24ff7f70f00fa7cc06efa49a706535a449ea5a1dddbd6658c930aff6ad66d95'
            '7f172dc9318b3a19b774e5062d2f467dcf179fdaac5cc0bb5f33ad218b07dc820c1c7141d024ed8b31f52e6d6f18e2b8e0111626d85703a536d30aa8e3187015')

package() {
  install -Dm 644 $srcdir/$pkgname.hook	$pkgdir/usr/share/libalpm/hooks/$pkgname.hook
  install -Dm 755 $srcdir/patch.py		$pkgdir/usr/share/vscodium/resources/app/patch.py
}

