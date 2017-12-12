# Maintainer: Henrik Gaßmann <henrik at gassmann dot onl>
# Contributor: Alexander Jesner <alexander at jesner dot eu>
# Forked from https://aur.archlinux.org/packages/nuget3/

pkgname=nuget4
pkgver=4.4.1
pkgrel=0
pkgdesc="Package manager for .NET."
arch=('any')
url="http://www.nuget.org"
license=('APACHE')
depends=('mono>=5.0.0' 'sh')
conflicts=('nuget' 'nuget3')
source=(https://dist.nuget.org/win-x86-commandline/v${pkgver}/nuget.exe
				'nuget')
install="${pkgname}.install"
sha384sums=('7c0f27eaf0b6f9141031e9ccdc6906f2d5223f3a543bfdb473e20cd15c3bcf8cb5e0550c962a43ded8c8cd45c280518b'
            '8cb9ce863e6b0669e28e7710a844985baf0c11626deed243d62995a2406eb135e634a4c381a757a26072edd017ea3232')

package() {
    install -d ${pkgdir}/usr/lib/nuget
    install -d ${pkgdir}/usr/bin

    install -m 0644 ${srcdir}/nuget.exe ${pkgdir}/usr/lib/nuget/nuget.exe
    install -m 0755 ${srcdir}/nuget ${pkgdir}/usr/bin/nuget
}

