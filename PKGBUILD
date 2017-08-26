# Maintainer: William Gathoye <william + aur at gathoye dot be>
# Contributor: Tavian Barnes <tavianator at tavianator dot com>

pkgname=un-apple-keyboard
pkgver=1.0
pkgrel=1
pkgdesc='Make Apple keyboards like all your other keyboards'
arch=('any')

url='https://github.com/wget/un-apple-keyboard'
license=('custom:WTFPL')

depends=('keyfuzz')

source=(
    '10-apple-keyboard.rules'
    'fix-apple-keyboard'
    'apple_keyboard.keyfuzz'
    'hid_apple.conf'
    'LICENSE'
)
sha512sums=(
    '71787ecf57e0a828efee84d71325ae7f429ff3239c87623a847642de07bb3ac0e72c79fb579824568983913d754843a267c9ba4eb26f13622aa5ef2f890aafa6'
    'ce1b19813277795e65470672f69febaed31d6af86fd1b52ad7e4f355ad5bb2770f4b4d1a4bbddc244772f68dfec6c527e3b84d0454a4110ca355b2adf3e39240'
    '09ce06a537ed7562e3eb95e8c2893a525354f012c2b7df2e790b3e6a3a1e3bcfeeecf8794686ba2654944390e5f8e1eaa133d4cd2812becb43f9fea8720a0665'
    '37da03d51f98c5af95318da0d1106b470191039fed199707f5c14d6b4aee224a7a2d865c6ce68baae8b9b4ea249414bb69c368590220b0e645ccfccee6b66e11'
    '977f12355e27a13cdadcc122d126bea2bd4e562b2b014f4c90b5592a11dd9245092c54d98cbd724d1dfebf31030e61ae4009a29f6bb6642d917eb28d112a3eb0'
)

package() {
    install -D -m644 "${srcdir}/10-apple-keyboard.rules" "${pkgdir}/etc/udev/rules.d/10-apple-keyboard.rules"
    install -D -m755 "${srcdir}/fix-apple-keyboard" "${pkgdir}/usr/bin/fix-apple-keyboard"
    install -D -m644 "${srcdir}/apple_keyboard.keyfuzz" "${pkgdir}/etc/keyfuzz/apple_keyboard.keyfuzz"
    install -D -m644 "${srcdir}/hid_apple.conf" "${pkgdir}/etc/modprobe.d/hid_apple.conf"
    install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
}
