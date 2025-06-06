# Maintainer: myt <myt at qq dot com>
pkgname=fonts-apple
pkgver=20.0d4e1
pkgrel=13
epoch=1
pkgdesc='Apple公司出品的字体,包含苹方简体和繁体，圆简粗体。少女简粗体，SFPro系列和Monaco等宽英文体和AppleColorEmoji符号字体。🏃'
arch=('any')
url='https://developer.apple.com/fonts/'
license=('custom:apple-restricted-font')
makedepends=('tar')
source=("git+https://github.com/maoyaotang12/fonts-apple.git#tag=${pkgver}?signed"
)
sha256sums=('a84f0df76246bf5a5fb92020e450c70bb1984634f713f8c01d75aefe96f08098')

package(){
    cd "${srcdir}/${pkgname}/Apple";
    find . -type d -exec install -d -m 0755 {} "${pkgdir}/usr/share/fonts/Apple/" \;
    find . -type f -exec install -m644 {} -D "${pkgdir}/usr/share/fonts/Apple/"{} \;
	install -d "${pkgdir}/etc/fonts/conf.avail"
    cd "${srcdir}/${pkgname}/123";
	install -Dm644 -t "$pkgdir/etc/fonts/conf.avail" "$srcdir/${pkgname}/123/55-apple-color-emoji.conf"
	install -Dm644 -t "$pkgdir/etc/fonts/conf.avail" "$srcdir/${pkgname}/123/55-fonts-apple.conf"
	install -Dm644 -t "$pkgdir/etc/fonts/conf.avail" "$srcdir/${pkgname}/123/55-fonts-apple-monospace.conf"
	install -Dm644 -t "$pkgdir/etc/fonts/conf.avail" "$srcdir/${pkgname}/123/55-fonts-apple-sans-serif.conf"
	install -Dm644 -t "$pkgdir/etc/fonts/conf.avail" "$srcdir/${pkgname}/123/55-fonts-pingfang.conf"
	install -d "${pkgdir}/etc/fonts/conf.d"
	ln -s "/etc/fonts/conf.avail/55-apple-color-emoji.conf" "${pkgdir}/etc/fonts/conf.d/"
	ln -s "/etc/fonts/conf.avail/55-fonts-apple.conf" "${pkgdir}/etc/fonts/conf.d/"
	ln -s "/etc/fonts/conf.avail/55-fonts-apple-monospace.conf" "${pkgdir}/etc/fonts/conf.d/"
	ln -s "/etc/fonts/conf.avail/55-fonts-apple-sans-serif.conf" "${pkgdir}/etc/fonts/conf.d/"
	ln -s "/etc/fonts/conf.avail/55-fonts-pingfang.conf" "${pkgdir}/etc/fonts/conf.d/"
}
