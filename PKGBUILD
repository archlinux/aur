# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Tom Vincent <aur@tlvince.com>
pkgname=friends
_gemname=$pkgname
pkgver=0.55
pkgrel=2
pkgdesc="Spend time with the people you care about. Introvert-tested. Extrovert-approved."
arch=('any')
url="https://github.com/JacobEvelyn/friends"
license=(MIT)
depends=('ruby')
makedepends=('rubygems')
source=("friends"
        "https://rubygems.org/downloads/$pkgname-$pkgver.gem"
        "https://rubygems.org/downloads/tty-screen-0.8.1.gem"
        "https://rubygems.org/downloads/unicode_utils-1.4.0.gem"
        "https://rubygems.org/downloads/unicode-display_width-2.1.0.gem"
        "https://rubygems.org/downloads/strings-ansi-0.2.0.gem"
        "https://rubygems.org/downloads/strings-0.2.1.gem"
        "https://rubygems.org/downloads/tty-pager-0.14.0.gem"
        "https://rubygems.org/downloads/paint-2.2.1.gem"
        "https://rubygems.org/downloads/gli-2.21.0.gem"
        "https://rubygems.org/downloads/chronic-0.10.2.gem")
noextract=("friends"
           "$pkgname-$pkgver.gem"
           "tty-screen-0.8.1.gem"
           "unicode_utils-1.4.0.gem"
           "unicode-display_width-2.1.0.gem"
           "strings-ansi-0.2.0.gem"
           "strings-0.2.1.gem"
           "tty-pager-0.14.0.gem"
           "paint-2.2.1.gem"
           "gli-2.21.0.gem"
           "chronic-0.10.2.gem")
sha512sums=('09297ce841b0c424c965b5098e829e6ab2af5cdec2e545b970a3e5bcd10f374588a668b78cc380aca85525bcfea232bfdeebc6eeacf10fbf0cb6ba21bb6ab8f6'
            'c2c032e17e9c30fefe32cecf162fdfb8e3eaef9767502b0a919bca800e48ac866319a2b716347da0edb4b382c30bd41d53395d01a19ec1eec5f2b09771e2087a'
            '47abedf2212475c81c7f84272889b8041bcd8ee1b646d94c609fe4936b43d2be2e14194e87990ecf722a8a9be7b651dbaf5d0f2d615271b12df0c6c887c8467c'
            'c7c34ada41b76ce9d06c3451451881c914903f532a555e4353d895ae52e36dea37ff7cf5ad3254fc188270514034dcd5ccd5a68fa3d65b6e2e3ad62d02bc4237'
            '5f988de4235c5fd58d7043eb5ddee8ceb8c68dbdfed334636a9aa9deea573435fa35aa630ef4e9c5ec8c34fa25ea16770d84b71c14cc69ebf2dc33703ae8a102'
            '0ec7662968d61a6d94ccf65952ef07cf13ed4cc9f33e8519a22c85149e6a285dfc69f9cb32ee1d64195c6cbdfdde77de2995bfe99d038ce8047afc35a8f2cc29'
            'a7bed5536c243dbc14c5affb9a0ad60be86c49e4c509f289d614c1fea5600e792acfae2849d87b2e29a785a3caa2916902c457504eee0e967f9838e60918b805'
            '3bc569333d0ccf6d826fe723420ac20a9cc61d3fd6ce6d2a65429b33ad235d61a55bd198a7cb79e3331aabf505228ddfdbda354625d3b25bc2b7f4f203a311f4'
            '2d0860bc134446a422e6b97f0ba049bdbc6868b4c55620122a64ae4d55beeb1626a597172fa64fa847cfc89d191a59cd8de3f13c460192ba2089b68026d32ad4'
            'bc59db1476f9dc399a62886e8940cd6d0fa049be682e954d3c0591b9692c1a25ee59dd2e006e058507801c966e78bd87e9b10423dbdfc889d2fd564224ef2278'
            '4efaa6453a38e62f15e7286b9b62891fdf2b4363cf8bc0b1078d22ab18863bb65db46ad523801801c76c5b751e52809a769d49743ca9369ddee2be1c526c67be')

package() {
  gem install --local --no-document --no-user-install --install-dir "$pkgdir/usr/lib/$pkgname" $pkgname-$pkgver.gem
  rm $pkgdir/usr/lib/$pkgname/cache/*

  install -Dm755 -t "$pkgdir/usr/bin" friends
}
