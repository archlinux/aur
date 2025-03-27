pkgname=larksuite-portable
pkgver=1
pkgrel=1
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

sha256sums=('e76080f9448cf4413560cfe0b9209daf0090b1933752929a1b71d27035248960'
            '0a495db9a6c9fc8e021bcf487256600f9247532eb0e448e0477ea6ecc22169d2'
            '70ab135d3ccccd9317fa588814ba81165613d87b66f36c10227c7b4c6233f97f'
            '18a20dbb16cc382a7b5cb9f3a3914364948bcaef27fbd3fba601649926cb707c'
            '7e258a5f2719a767e9e2e918f13426db4e714c156c2a590b1b806c7c5d5f9c58')

function package() {
	install -Dm644 portable-config "${pkgdir}/usr/lib/larksuite-portable/portable-config"
	install -Dm644 larksuite-portable.hook "${pkgdir}/usr/share/libalpm/hooks/larksuite-portable.hook"
	install -Dm644 com.larksuite.suite.desktop "${pkgdir}/usr/share/applications/com.larksuite.suite.desktop"
	install -Dm755 larksuite.sh "${pkgdir}/usr/lib/larksuite-portable/larksuite.sh"
	install -Dm755 install-hook.sh "${pkgdir}/usr/lib/larksuite-portable/install-hook.sh"
}
