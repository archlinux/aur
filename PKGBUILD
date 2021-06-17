# Maintainer: Deming Li <me@yuuza.net>
# Hooks: https://www.reddit.com/r/archlinux/comments/4zrsc3/keep_your_system_fully_functional_after_a_kernel/d6yin0r/
pkgname=kernel-modules-hook-reflink
pkgver=0.1.8
pkgrel=1
pkgdesc="Keeps your system fully functional after a kernel upgrade (forked version using \`cp --reflink\`, maybe better for btrfs)"
arch=('any')
url="https://github.com/lideming/kernel-modules-hook"
license=('UNLICENSE')
depends=('coreutils')
conflicts=('kernel-modules-hook')
install="kernel-modules-hook.install"
source=("linux-modules-cleanup.conf"
		"linux-modules-cleanup.service"
		"10-linux-modules-post.hook"
		"10-linux-modules-pre.hook"
		"UNLICENSE")
sha256sums=('4169b44c297ddb7aad2220c6eba7c7942e3396f92528c59617955ab5560cb4cf'
            '023464fbc648365d64b96626eeef2628bb10cae757a00db3a2624b0a61d0e41e'
            'bf69f80901d8cfcc24023602f2b91190157c51833459c4a51002f37eb28d983a'
            '6819bb35bce6d4fe722865f58b819cf001097c83d99f23d35020d288379d3099'
            '7e12e5df4bae12cb21581ba157ced20e1986a0508dd10d0e8a4ab9a4cf94e85c')

package() {
	install -Dm644 'linux-modules-cleanup.conf' "${pkgdir}/usr/lib/tmpfiles.d/linux-modules-cleanup.conf"
	install -Dm644 'linux-modules-cleanup.service' "${pkgdir}/usr/lib/systemd/system/linux-modules-cleanup.service"
	install -Dm644 '10-linux-modules-post.hook' "${pkgdir}/usr/share/libalpm/hooks/10-linux-modules-post.hook"
	install -Dm644 '10-linux-modules-pre.hook' "${pkgdir}/usr/share/libalpm/hooks/10-linux-modules-pre.hook"
	install -Dm644 'UNLICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/UNLICENSE"
}
