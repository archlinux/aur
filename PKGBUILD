pkgname=larksuite-portable
pkgver=1
pkgrel=2
epoch=1
pkgdesc="Optional sandbox for Larksuite"
arch=('any')
url="https://github.com/Kraftland/portable"
license=('GPL3')
options=(!debug !strip)
provides+=('bytedance-lark' 'lark')
depends=('larksuite-bin' 'portable')

source=(
	portable-config
	larksuite-portable.hook
	com.larksuite.suite.desktop
	larksuite.sh
	install-hook.sh
)

sha256sums=('2e00c8c8a4b5d6f6bd933831844609c24d5d7c9a944364641364d68961234740'
            '0a495db9a6c9fc8e021bcf487256600f9247532eb0e448e0477ea6ecc22169d2'
            '70ab135d3ccccd9317fa588814ba81165613d87b66f36c10227c7b4c6233f97f'
            '35f4e877c8fce8fca65406c6bb57b884d02bf83ab98ace6d2c9829ff7ab2f4b4'
            '7e258a5f2719a767e9e2e918f13426db4e714c156c2a590b1b806c7c5d5f9c58')

function package() {
	install -Dm644 portable-config "${pkgdir}/usr/lib/larksuite-portable/portable-config"
	install -Dm644 larksuite-portable.hook "${pkgdir}/usr/share/libalpm/hooks/larksuite-portable.hook"
	install -Dm644 com.larksuite.suite.desktop "${pkgdir}/usr/share/applications/com.larksuite.suite.desktop"
	install -Dm755 larksuite.sh "${pkgdir}/usr/lib/larksuite-portable/larksuite.sh"
	install -Dm755 install-hook.sh "${pkgdir}/usr/lib/larksuite-portable/install-hook.sh"
}
