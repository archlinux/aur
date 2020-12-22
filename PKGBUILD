# Maintainer: xiretza <xiretza+aur@gmail.com>
# Maintainer: Rod Kay   <charlie5 on #ada at freenode.net>

pkgname=libadalang
_libadalang_ver=2020-20200429-19982
_langkit_ver=2020-20200429-19994
pkgver=2020
pkgrel=1
pkgdesc="A high performance semantic engine for the Ada programming language."

arch=('i686' 'x86_64')
url="https://github.com/AdaCore/libadalang"
license=('GPL')

depends=("gnatcoll-core" "gnatcoll-iconv" "gnatcoll-gmp")
makedepends=('gprbuild' 'python2-virtualenv' 'python2-setuptools')

_libadalang_checksum=b08f8035da44c241348f8b597dbdaf95a4d43cc7
_langkit_checksum=842969ffaa118d71e1efc466383f1c0cf663c464
source=("libadalang-$_libadalang_ver-src.tar.gz::https://community.download.adacore.com/v1/${_libadalang_checksum}?filename=libadalang-$_libadalang_ver-src.tar.gz"
        "langkit-$_langkit_ver-src.tar.gz::https://community.download.adacore.com/v1/${_langkit_checksum}?filename=langkit-$_langkit_ver-src.tar.gz")
noextract=()
sha1sums=("$_libadalang_checksum"
          "$_langkit_checksum")
sha256sums=('SKIP'
            'SKIP')

# This is an absolutely ugly hack to install all the python2 build dependencies
# (most of them have been dropped from repos and getting them into the AUR just
# for this package would be way too much effort). It works because they are
# only required for building, not at runtime - so they are fetched as sources
# and then installed in the build environment with pip (in a virtualenv).
#
# These variable assignments are generated from the libadalang REQUIREMENTS.dev
# using the attached gen_PKGBUILD_sources.sh script.
source+=(
	https://files.pythonhosted.org/packages/8e/a4/aa56533ecaa5f22ca92428f74e074d0c9337282933c722391902c8f9e0f8/Mako-1.0.1.tar.gz
	https://files.pythonhosted.org/packages/75/5e/b84feba55e20f8da46ead76f14a3943c8cb722d40360702b2365b91dec00/PyYAML-3.11.tar.gz
	https://files.pythonhosted.org/packages/63/2c/0a30c391708f827039be5569164ed039b1e46906a4bff5a348b0abe2945e/Sphinx-1.3.1-py2.py3-none-any.whl
	https://files.pythonhosted.org/packages/09/4f/89b06c7fdc09687bca507dc411c342556ef9c5a3b26756137a4878ff19bf/coverage-3.7.1.tar.gz
	https://files.pythonhosted.org/packages/51/c8/cb8a7f460e215e2de4b7d4d1186e661f0c6f452d146e08cfde68997953cc/e3_core-21.0.0-py2-none-any.whl
	https://files.pythonhosted.org/packages/0c/4e/1ea357e7783c756bb579333c1e4a026fb331371ee771f616ffedc781e531/enum-0.4.6.tar.gz
	https://files.pythonhosted.org/packages/6f/e9/08fd439384b7e3d613e75a6c8236b8e64d90c47d23413493b38d4229a9a5/enum34-1.1.2.tar.gz
	https://files.pythonhosted.org/packages/7b/58/2675697b6831e6ac4b7b7bc4e5dcdb24a2f39f8411186573eb0de16eb6d5/psutil-3.4.2.tar.gz
	https://files.pythonhosted.org/packages/1d/84/405b43b2c15bb61fcbd23416837ca7f18e261c56c64453923725e8160aa6/sphinx_rtd_theme-0.1.9-py2-none-any.whl
	https://files.pythonhosted.org/packages/1e/92/3d3cfd987ff1eea1b669dc525ef6ae8e8bbe9a82a72c4185ee77db84eed1/funcy-1.7.1.tar.gz
	https://files.pythonhosted.org/packages/37/38/ceda70135b9144d84884ae2fc5886c6baac4edea39550f28bcd144c1234d/docutils-0.12.tar.gz
	https://files.pythonhosted.org/packages/cc/37/669e64656240d1cbcf375731abc52440ff77ae7184f702aae031e381c8ea/autopep8-1.2.4-py2.py3-none-any.whl
	https://files.pythonhosted.org/packages/1d/76/d87a9a974b31eb72a243206f06bbdb2098618042c4a862ee5faf7967b05f/yapf-0.16.0-py2.py3-none-any.whl
	https://files.pythonhosted.org/packages/fb/40/f3adb7cf24a8012813c5edb20329eb22d5d8e2a0ecf73d21d6b85865da11/MarkupSafe-1.1.1-cp27-cp27mu-manylinux1_x86_64.whl
	https://files.pythonhosted.org/packages/be/39/32da3184734730c0e4d3fa3b2b5872104668ad6dc1b5a73d8e477e5fe967/Pygments-2.5.2-py2.py3-none-any.whl
	https://files.pythonhosted.org/packages/30/9e/f663a2aa66a09d838042ae1a2c5659828bb9b41ea3a6efa20a20fd92b121/Jinja2-2.11.2-py2.py3-none-any.whl
	https://files.pythonhosted.org/packages/15/a1/522dccd23e5d2e47aed4b6a16795b8213e3272c7506e625f2425ad025a19/Babel-2.8.0-py2.py3-none-any.whl
	https://files.pythonhosted.org/packages/ee/ff/48bde5c0f013094d729fe4b0316ba2a24774b3ff1c52d924a8a4cb04078a/six-1.15.0-py2.py3-none-any.whl
	https://files.pythonhosted.org/packages/10/ad/00b090d23a222943eb0eda509720a404f531a439e803f6538f35136cae9e/alabaster-0.7.12-py2.py3-none-any.whl
	https://files.pythonhosted.org/packages/7d/4b/cdf1113a0e88b641893b814e9c36f69a6fda28cd88b62c7f0d858cde3166/snowballstemmer-2.0.0-py2.py3-none-any.whl
	https://files.pythonhosted.org/packages/d4/70/d60450c3dd48ef87586924207ae8907090de0b306af2bce5d134d78615cb/python_dateutil-2.8.1-py2.py3-none-any.whl
	https://files.pythonhosted.org/packages/c9/dc/45cdef1b4d119eb96316b3117e6d5708a08029992b2fee2c143c7a0a5cc5/colorama-0.4.3-py2.py3-none-any.whl
	https://files.pythonhosted.org/packages/ab/42/3ad1c15d88b9b522058d436457a72f1544175b39b00442f4c93980261ff4/ld-0.5.0.tar.gz
	https://files.pythonhosted.org/packages/1a/70/1935c770cb3be6e3a8b78ced23d7e0f3b187f5cbfab4749523ed65d7c9b1/requests-2.23.0-py2.py3-none-any.whl
	https://files.pythonhosted.org/packages/c9/40/058b12e8ba10e35f89c9b1fdfc2d4c7f8c05947df2d5eb3c7b258019fda0/tqdm-4.46.0-py2.py3-none-any.whl
	https://files.pythonhosted.org/packages/60/ef/7681134338fc097acef8d9b2f8abe0458e4d87559c689a8c306d0957ece5/requests_toolbelt-0.9.1-py2.py3-none-any.whl
	https://files.pythonhosted.org/packages/e6/49/a35dd566626892d577e426dbe5ea424dd7fbe10645f2c1070dcba474eca9/stevedore-1.32.0-py2.py3-none-any.whl
	https://files.pythonhosted.org/packages/7e/02/ad1a92a72620cc17d448fe4dbdfbdf8fe1487ee7bfd82bb48308712c2f3c/netifaces-0.10.9-cp27-cp27mu-manylinux1_x86_64.whl
	https://files.pythonhosted.org/packages/42/3f/669429ce58de2c22d8d2c542752e137ec4b9885fff398d3eceb1a7f5acb4/pep8-1.7.1-py2.py3-none-any.whl
	https://files.pythonhosted.org/packages/4f/a4/879454d49688e2fad93e59d7d4efda580b783c745fd2ec2a3adf87b0808d/pytz-2020.1-py2.py3-none-any.whl
	https://files.pythonhosted.org/packages/e1/e5/df302e8017440f111c11cc41a6b432838672f5a70aa29227bf58149dc72f/urllib3-1.25.9-py2.py3-none-any.whl
	https://files.pythonhosted.org/packages/57/2b/26e37a4b034800c960a00c4e1b3d9ca5d7014e983e6e729e33ea2f36426c/certifi-2020.4.5.1-py2.py3-none-any.whl
	https://files.pythonhosted.org/packages/bc/a9/01ffebfb562e4274b6487b4bb1ddec7ca55ec7510b22e4c51f14098443b8/chardet-3.0.4-py2.py3-none-any.whl
	https://files.pythonhosted.org/packages/89/e3/afebe61c546d18fb1709a61bee788254b40e736cff7271c7de5de2dc4128/idna-2.9-py2.py3-none-any.whl
	https://files.pythonhosted.org/packages/96/ba/aa953a11ec014b23df057ecdbc922fdb40ca8463466b1193f3367d2711a6/pbr-5.4.5-py2.py3-none-any.whl
)
noextract+=(
	Mako-1.0.1.tar.gz
	PyYAML-3.11.tar.gz
	Sphinx-1.3.1-py2.py3-none-any.whl
	coverage-3.7.1.tar.gz
	e3_core-21.0.0-py2-none-any.whl
	enum-0.4.6.tar.gz
	enum34-1.1.2.tar.gz
	psutil-3.4.2.tar.gz
	sphinx_rtd_theme-0.1.9-py2-none-any.whl
	funcy-1.7.1.tar.gz
	docutils-0.12.tar.gz
	autopep8-1.2.4-py2.py3-none-any.whl
	yapf-0.16.0-py2.py3-none-any.whl
	MarkupSafe-1.1.1-cp27-cp27mu-manylinux1_x86_64.whl
	Pygments-2.5.2-py2.py3-none-any.whl
	Jinja2-2.11.2-py2.py3-none-any.whl
	Babel-2.8.0-py2.py3-none-any.whl
	six-1.15.0-py2.py3-none-any.whl
	alabaster-0.7.12-py2.py3-none-any.whl
	snowballstemmer-2.0.0-py2.py3-none-any.whl
	python_dateutil-2.8.1-py2.py3-none-any.whl
	colorama-0.4.3-py2.py3-none-any.whl
	ld-0.5.0.tar.gz
	requests-2.23.0-py2.py3-none-any.whl
	tqdm-4.46.0-py2.py3-none-any.whl
	requests_toolbelt-0.9.1-py2.py3-none-any.whl
	stevedore-1.32.0-py2.py3-none-any.whl
	netifaces-0.10.9-cp27-cp27mu-manylinux1_x86_64.whl
	pep8-1.7.1-py2.py3-none-any.whl
	pytz-2020.1-py2.py3-none-any.whl
	urllib3-1.25.9-py2.py3-none-any.whl
	certifi-2020.4.5.1-py2.py3-none-any.whl
	chardet-3.0.4-py2.py3-none-any.whl
	idna-2.9-py2.py3-none-any.whl
	pbr-5.4.5-py2.py3-none-any.whl
)
sha1sums+=(
	SKIP
	SKIP
	SKIP
	SKIP
	SKIP
	SKIP
	SKIP
	SKIP
	SKIP
	SKIP
	SKIP
	SKIP
	SKIP
	SKIP
	SKIP
	SKIP
	SKIP
	SKIP
	SKIP
	SKIP
	SKIP
	SKIP
	SKIP
	SKIP
	SKIP
	SKIP
	SKIP
	SKIP
	SKIP
	SKIP
	SKIP
	SKIP
	SKIP
	SKIP
	SKIP
)
sha256sums+=(
	45f0869febea59dab7efd256fb451c377cbb7947bef386ff0bb44627c31a8d1c
	c36c938a872e5ff494938b33b14aaa156cb439ec67548fcab3535bb78b0846e8
	2ddf18da3b0621fa43fee4b7290da0ae789b46fb899278a8acccda195c4979a7
	d1aea1c4aa61b8366d6a42dd3650622fbf9c634ed24eaf7f379c8b970e5ed44e
	186e994de1f06fcc688f7d685ea77fb7551402735b8e5b285825b93faa553d62
	54e78526b166982b36884613f35a76d9a6711c49810d3ec1a05b10c9b31f938e
	2475d7fcddf5951e92ff546972758802de5260bf409319a9f1934e6bbc8b1dc7
	b17fa01aa766daa388362d0eda5c215d77e03a8d37676b68971f37bf3913b725
	3c38d037713bd78043486eea5bf771d71ed697ec25c09e16f49e44887f7fe184
	cc66a1f614c049d77481a7da94f6aca7ba958a97d6a16e47b58c3d60f8f14612
	c7db717810ab6965f66c8cf0398a98c9d8df982da39b4cd7f162911eb89596fa
	a2ab1a03a58c8d664ee875ca73d5b96b7135c13863e9aad4b64b888acdeb619b
	3a3c2c6e70a5d4fd2acbc290de7aaa64c6a65efd63a476c44a875eb1b2eef606
	43a55c2930bbc139570ac2452adf3d70cdbb3cfe5912c71cdce1c2c6bbd9c5d1
	2a3fe295e54a20164a9df49c75fa58526d3be48e14aceba6d6b1e8ac0bfd6f1b
	f0a4641d3cf955324a89c04f3d94663aa4d638abe8f733ecd3582848e1c37035
	d670ea0b10f8b723672d3a6abeb87b565b244da220d76b4dba1b66269ec152d4
	8b74bedcbbbaca38ff6d7491d76f2b06b3592611af620f8426e82dddb04a5ced
	446438bdcca0e05bd45ea2de1668c1d9b032e1a9154c2c259092d77031ddd359
	209f257d7533fdb3cb73bdbd24f436239ca3b2fa67d56f6ff88e86be08cc5ef0
	75bb3f31ea686f1197762692a9ee6a7550b59fc6ca3a1f4b5d7e32fb98e2da2a
	7d73d2a99753107a36ac6b455ee49046802e59d9d076ef8e47b61499fa29afff
	e58798bdff61b214d7dc026eee43952f866800653315b20b4a64cf97cb6d9ecc
	43999036bfa82904b6af1d99e4882b560e5e2c68e5c4b0aa03b655f3d7d73fee
	acdafb20f51637ca3954150d0405ff1a7edde0ff19e38fb99a80a66210d2a28f
	380606e1d10dc85c3bd47bf5a6095f815ec007be7a8b69c878507068df059e6f
	a4e7dc759fb0f2e3e2f7d8ffe2358c19d45b9b8297f393ef1256858d82f69c9b
	4921ed406386246b84465950d15a4f63480c1458b0979c272364054b29d73084
	b22cfae5db09833bb9bd7c8463b53e1a9c9b39f12e304a8d0bba729c501827ee
	a494d53b6d39c3c6e44c3bec237336e14305e4f29bbf800b599253057fbb79ed
	88206b0eb87e6d677d424843ac5209e3fb9d0190d0ee169599165ec25e9d9115
	1d987a998c75633c40847cc966fcf5904906c920a7f17ef374f5aa4282abd304
	fc323ffcaeaed0e0a02bf4d117757b98aed530d9ed4531e3e15460124c106691
	a068a21ceac8a4d63dbfd964670474107f541babbd2250d61922f029858365fa
	579170e23f8e0c2f24b0de612f71f648eccb79fb1322c814ae6b3c07b5ba23e8
)

prepare()
{
  cd "$srcdir/libadalang-$_libadalang_ver-src"
  virtualenv2 "$srcdir/venv"

  (
    source "$srcdir/venv/bin/activate"
    pip install --no-index --find-links "$srcdir" -r <(grep -v langkit REQUIREMENTS.dev)
  )
}

build() 
{
  cd "$srcdir/libadalang-$_libadalang_ver-src"

  (
    source "$srcdir/venv/bin/activate"

    export PYTHONPATH="$srcdir/langkit-$_langkit_ver-src:$PYTHONPATH"

    python2 ada/manage.py generate
    python2 ada/manage.py build --build-mode=prod --gargs="-R -cargs $CFLAGS -largs $LDFLAGS -gargs"
  )
}


package()
{
  cd "$srcdir/libadalang-$_libadalang_ver-src"

  (
    source "$srcdir/venv/bin/activate"

    export PYTHONPATH="$srcdir/langkit-$_langkit_ver-src:$PYTHONPATH"

    python2 ada/manage.py install --build-mode=prod "$pkgdir/usr"
  )

  # Install the Python binding
  # Has to happen outside virtualenv
  cd build/python
  python2 setup.py install --root="$pkgdir"

  rm -fr "$pkgdir/usr/python"

  # Fix ocaml bindings location
  mkdir -p "$pkgdir/usr/lib/ocaml/"
  mv "$pkgdir/usr/ocaml" "$pkgdir/usr/lib/ocaml/libadalang"
}
