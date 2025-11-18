# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=kiro-cli-bin
_name=${pkgname%-bin}
pkgver=1.20.0
pkgrel=1
pkgdesc="Prompt to code to deployment in your terminal"
arch=('x86_64')
url='https://kiro.dev/cli/'
# By downloading and using Kiro CLI, you agree to the following:
#   AWS Customer Agreement: https://aws.amazon.com/agreement/
#   AWS Intellectual Property License: https://aws.amazon.com/legal/aws-ip-license-terms/
#   Service Terms: https://aws.amazon.com/service-terms/
#   Privacy Notice: https://aws.amazon.com/privacy/
license=('LicenseRef-AWS-IPL')
depends=('gcc-libs' 'glibc' 'sh' 'xz')
provides=("$_name")
conflicts=("$_name")
replaces=('amazon-q')
source=("$pkgname-$pkgver::https://desktop-release.q.us-east-1.amazonaws.com/latest/kirocli-x86_64-linux.zip")
b2sums=('778b1532296eb1965713d17bb6a919d7d7f8ec17a8526b9a037770d1396080471736c3bbf93c77f1c8f8bd43057ee136dc92f43b7df3822394aa69dd44cbe575')

package() {
	cd kirocli
    install -Dm755 bin/$_name "$pkgdir/usr/bin/$_name"
    install -Dm755 bin/$_name-chat "$pkgdir/usr/bin/$_name-chat"
    install -Dm755 bin/$_name-term "$pkgdir/usr/bin/$_name-term"
    install -Dm755 bin/q "$pkgdir/usr/bin/q"
    install -Dm755 bin/q "$pkgdir/usr/bin/qchat"
}
