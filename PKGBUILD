# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-unsloth
_pkgname=unsloth
pkgver=2026.11.1
# No upstream tag matches this version. Pin its exact version-bump commit.
# unsloth/_version.py supplies setuptools' dynamic version.
_commit=bbee0dc04fb3c3c8485fc02c0e88da48d2c4dc7b
_source="${_pkgname}-${_commit}"
pkgrel=1
pkgdesc="2-5x faster LLM fine-tuning with 70% less memory"
arch=('x86_64')
# Preserve wheel RECORD bytes. The C allocator links into Rust cdylibs,
# so do not pass makepkg's C LTO objects through that non-LTO final link.
options=('!strip' '!debug' '!lto')
url="https://github.com/unslothai/unsloth"
# Original license and notice sets are shipped for all emitted browser code.
license=('Apache-2.0' 'AGPL-3.0-only' '0BSD' 'BSD-2-Clause' 'BSD-3-Clause'
         'CC0-1.0' 'ISC' 'MIT' 'MIT-0' 'Unicode-3.0' 'Unlicense' 'Zlib'
         'Apache-2.0 WITH LLVM-exception OR BSL-1.0')
depends=(
    'glibc'
    'gcc-libs'
    'python'
    'python-unsloth-zoo>=2026.11.1'
    'python-pytorch>=2.4'
    'python-pytorch<2.16'
    'python-torchvision'
    'python-triton>=3'
    # Imported unconditionally by unsloth.kernels.utils during import unsloth.
    'python-bitsandbytes>=0.45.5'
    'python-numpy'
    'python-packaging>=24.1'
    'python-psutil'
    'python-tqdm'
    'python-protobuf'
    'python-sentencepiece>=0.2'
    'python-transformers>=4.52.4'
    'python-transformers<6'
    'python-datasets>=3.4.1'
    'python-datasets<6'
    'python-accelerate>=0.34.1'
    'python-accelerate<2'
    'python-peft>=0.18'
    'python-peft<1'
    'python-trl>=0.18.2'
    'python-trl<=1.15.0'
    'python-huggingface-hub>=0.34'
    # Current Arch Hub 2.x is a compatibility trial, verified separately.
    # Its epoch is part of the package constraint.
    'python-huggingface-hub<1:3'
    'python-hf-transfer'
    'python-diffusers>=0.39.0'
    'python-tyro'
    'python-torchao>=0.13'
    'python-sentence-transformers'
    'python-wheel>=0.42'
    # Top-level project dependencies.
    'python-typer>=0.19.0'
    'python-json5>=0.9.25'
    'python-certifi>=2026.10.19'
    'python-rich'
    'python-pydantic'
    'python-yaml'
    'python-nest-asyncio'
    # Direct imports used by the CLI, loaders and tokenizer helpers.
    'python-click'
    'python-jinja'
    'python-requests'
    'python-safetensors'
    'python-structlog'
    # The wheel includes the Studio backend and the CLI starts it directly.
    'diceware'
    'nodejs>=22.12'
    'python-aiofiles'
    'python-fastmcp'
    'python-av'
    'python-docx'
    'python-hf-xet'
    'python-markdown-it-py'
    'python-pymupdf'
    'python-urllib3>=2.8.0'
    'python-cryptography'
    'python-fastapi'
    'python-httpx'
    'python-matplotlib'
    'python-multipart'
    'python-pandas'
    'python-pyjwt'
    'python-starlette'
    'uvicorn'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-setuptools-scm'
    'npm'
    'corepack'
    'rust>=1:1.97'
    'cmake'
)
checkdepends=(
    'chromium'
    'git'
    'nodejs'
    'uv'
    'python-boto3'
    'python-pytest'
    'python-pytest-asyncio'
    'python-pytest-socket'
    'python-sqlalchemy'
    'python-torchcodec'
)
optdepends=(
    'git: clone external repositories for GGUF conversion and Studio audio workflows'
    'python-boto3: S3 datasets in Studio'
    'python-ddgs: web search in Studio'
    'python-gguf: GGUF metadata and model export in Studio'
    'python-pymupdf4llm: richer Markdown extraction from PDFs in Studio'
    'python-sqlite-vec: accelerated local vector search in Studio'
    'python-xformers: for memory-efficient attention'
    'python-openai: OpenAI-backed synthetic data generation'
    'python-soundfile: audio processing in Studio'
    'python-torchcodec: audio model loading'
    'python-wandb: experiment tracking'
)
source=(
    "${_pkgname}-${_commit}.tar.gz::$url/archive/${_commit}.tar.gz"
    'frontend-runtime-inventory.ts'
    'frontend-vite.config.ts'
    'arch-torchvision-pair.patch'
    'frontend-source-build.py'
    'frontend-sources.json'
    'frontend-dagre-package-lock.json'
    'frontend-dexie-package-lock.json'
    'frontend-notices.py'
    'frontend-notice-sources.json'
    'docs-ui-source-build.py'
    'docs-ui-sources.json'
    'docs-ui-webpack-inventory.cjs'
    'docs-ui-swagger-package-lock.json.part1'
    'docs-ui-swagger-package-lock.json.part2'
    'docs-ui-notices.py'
    'packaging-check-docs-ui.mjs'
    'frontend-0-a7c0bd1c0edf89c53c3efd05557c9920289d2fd2.tar.gz::https://github.com/dagrejs/dagre/archive/a7c0bd1c0edf89c53c3efd05557c9920289d2fd2.tar.gz'
    'frontend-1-4549b8d03307891143e8a50d39fcdab1f16f77cf.tar.gz::https://github.com/iamkun/dayjs/archive/4549b8d03307891143e8a50d39fcdab1f16f77cf.tar.gz'
    'frontend-2-ab489deaa7434c549c32225d03ec1e30cacb10c4.tar.gz::https://github.com/dexie/Dexie.js/archive/ab489deaa7434c549c32225d03ec1e30cacb10c4.tar.gz'
    'frontend-3-0f2f1e4d0509514417db83fe5b86bde90e0ffe8d.tar.gz::https://github.com/Stuk/jszip/archive/0f2f1e4d0509514417db83fe5b86bde90e0ffe8d.tar.gz'
    'frontend-4-878a61be7743a8ec4ee725b0b5efa810b5167c79.tar.gz::https://github.com/KaTeX/KaTeX/archive/878a61be7743a8ec4ee725b0b5efa810b5167c79.tar.gz'
    'frontend-5-56a2762171b1294d643501e8d14f120db6b27bd7.tar.gz::https://github.com/pshihn/rough/archive/56a2762171b1294d643501e8d14f120db6b27bd7.tar.gz'
    'frontend-6-15ba1aee86ab053ada83326f563e78b4d2c7f4f7.tar.gz::https://github.com/vercel/streamdown/archive/15ba1aee86ab053ada83326f563e78b4d2c7f4f7.tar.gz'
    'frontend-7-0b841e45b7bee27cfb6b0738cafdd85f6ae58d48.tar.gz::https://github.com/unjs/unpdf/archive/0b841e45b7bee27cfb6b0738cafdd85f6ae58d48.tar.gz'
    'frontend-8-f56dc86014bb00c5a239680df53d2010e9aad0f8.tar.gz::https://github.com/mozilla/pdf.js/archive/f56dc86014bb00c5a239680df53d2010e9aad0f8.tar.gz'
    'frontend-9-ada343803945d977b9a1be8e72184b0422f8e5d1.tar.gz::https://github.com/mozilla/pdf.js/archive/ada343803945d977b9a1be8e72184b0422f8e5d1.tar.gz'
    'frontend-10-8a2ac221a878a0fc5839f2035c1e16575cfa3440.tar.gz::https://github.com/vercel/streamdown/archive/8a2ac221a878a0fc5839f2035c1e16575cfa3440.tar.gz'
    'docs-ui-0-30d8f985caeca5bb9400cf21403686ec5a82c1cc.tar.gz::https://codeload.github.com/swagger-api/swagger-ui/tar.gz/30d8f985caeca5bb9400cf21403686ec5a82c1cc'
    'docs-ui-1-d140213cb6a977cc7376d15e308f0cd63498ed56.tar.gz::https://codeload.github.com/Redocly/redoc/tar.gz/d140213cb6a977cc7376d15e308f0cd63498ed56'
    'frontend-radix-LICENSE::https://raw.githubusercontent.com/radix-ui/primitives/fcef0668a5c827e5a4baac405474d75680f9a4eb/LICENSE'
    'frontend-rehype-katex-LICENSE::https://raw.githubusercontent.com/remarkjs/remark-math/88a9497e1ede93b958237c85edbf5651faeca7af/license'
    'frontend-victory-vendor-LICENSE::https://raw.githubusercontent.com/FormidableLabs/victory/d9d9ca2d5038d6ef9de91f2cef39e6fb2733baa6/LICENSE.txt'
    'frontend-qrcode-generator-LICENSE::https://raw.githubusercontent.com/kazuhikoarase/qrcode-generator/83b7e8fe3fddd3b0368dbafd6ce56995bd25e3c8/LICENSE'
    'frontend-remark-math-LICENSE::https://raw.githubusercontent.com/remarkjs/remark-math/d5d0660b150810a535bbb07eac6cc96a4510aa24/license'
    'frontend-react-remove-scroll-bar-LICENSE::https://raw.githubusercontent.com/theKashey/react-remove-scroll-bar/7301c160fda44cb8cf2b9fdfde61efad35736196/LICENSE'
    'frontend-use-composed-ref-standard-license.txt::https://raw.githubusercontent.com/spdx/license-list-data/d46e94e2c78ceede1cfc63cfa0396472d2798d4c/text/MIT.txt'
    'frontend-dingbat-to-unicode-standard-license.txt::https://raw.githubusercontent.com/spdx/license-list-data/d46e94e2c78ceede1cfc63cfa0396472d2798d4c/text/BSD-2-Clause.txt'
    'docs-ui-notice-sources.json'
    'docs-styled-components-LICENSE::https://raw.githubusercontent.com/styled-components/styled-components/4f54d97af2a05e571b357e2806697e479af065a0/LICENSE'
    'docs-toggle-selection-standard-terms.txt::https://raw.githubusercontent.com/spdx/license-list-data/d46e94e2c78ceede1cfc63cfa0396472d2798d4c/text/MIT.txt'
    'docs-short-unique-id-standard-terms.txt::https://raw.githubusercontent.com/spdx/license-list-data/d46e94e2c78ceede1cfc63cfa0396472d2798d4c/text/Apache-2.0.txt'
    'docs-highlightjs-vue-standard-terms.txt::https://raw.githubusercontent.com/spdx/license-list-data/d46e94e2c78ceede1cfc63cfa0396472d2798d4c/text/CC0-1.0.txt'
    'docs-tr46-standard-terms.txt::https://raw.githubusercontent.com/spdx/license-list-data/d46e94e2c78ceede1cfc63cfa0396472d2798d4c/text/MIT.txt'
    'docs-workerize-loader-upstream-README.md::https://raw.githubusercontent.com/Redocly/workerize-loader/6897b3fa5784c8f4970c81e04dbc8025f3c60938/README.md'
    'docs-format-upstream-README.md::https://raw.githubusercontent.com/samsonjs/format/4f898096759776b7c84fa7a25b13c923dadfe46e/Readme.md'
    'docs-workerize-format-MIT-template.txt::https://raw.githubusercontent.com/LestaD/license.js/f921751cb8d7f82f6abfe0551c72353f49982748/licenses/MIT.txt'
    'oxc-source-build.py'
    'oxc-sources.json'
    'oxc-notices.json'
    'packaging-studio-assets.py'
    'packaging-check-oxc.py'
    'packaging-check-studio-service.py'
    'oxc-73e6b564737a29ecebf428d276421dcc492836df.tar.gz::https://codeload.github.com/oxc-project/oxc/tar.gz/73e6b564737a29ecebf428d276421dcc492836df'
    'oxc-07ed78f4abde4020ca7919381ffea4da8616b78a.tar.gz::https://codeload.github.com/oxc-project/oxc/tar.gz/07ed78f4abde4020ca7919381ffea4da8616b78a'
    'oxc-notice-20538257cfb1812d4816.txt::https://raw.githubusercontent.com/oxc-project/nodejs-built-in-modules/9117efa38fe088325e8a1036a8ddea7f3546c1ac/LICENSE'
    'oxc-notice-23f18e03dc49df91622f.txt::https://raw.githubusercontent.com/cloudwego/sonic-rs/41ae6e8a5962da26eab34432d1412f35ea6d199e/licenses/serde_json/LICENSE-MIT'
    'oxc-notice-3f1ce66533302df3a32e.txt::https://raw.githubusercontent.com/napi-rs/napi-rs/8bab46ee5dfd48a7b51e8bad3d09aed315ada4df/LICENSE'
    'oxc-notice-43070e2d4e532684de52.txt::https://raw.githubusercontent.com/cloudwego/sonic-rs/41ae6e8a5962da26eab34432d1412f35ea6d199e/LICENSE'
    'oxc-notice-43293fded4890ea79c7e.txt::https://raw.githubusercontent.com/cloudwego/sonic-rs/41ae6e8a5962da26eab34432d1412f35ea6d199e/licenses/LICENSE-sonic_cpp'
    'oxc-notice-5c932d88256b4ab958f6.txt::https://raw.githubusercontent.com/oxc-project/javascript-globals/a3888aa28f1312f80df0b8e5cb885106277e490e/LICENSE'
    'oxc-notice-62c7a1e35f56406896d7.txt::https://raw.githubusercontent.com/cloudwego/sonic-rs/41ae6e8a5962da26eab34432d1412f35ea6d199e/licenses/LICENSE-rust'
    'oxc-notice-664f4e8a5ae846b8a949.txt::https://raw.githubusercontent.com/cloudwego/sonic-rs/41ae6e8a5962da26eab34432d1412f35ea6d199e/licenses/LICENSE-simdjson'
    'oxc-notice-6fb8065469e053e7193b.txt::https://raw.githubusercontent.com/oxc-project/oxc-browserslist/a9b49a18042671c91811dc1074e01b9c08331327/LICENSE'
    'oxc-notice-71674605ec4c087fe9eb.txt::https://raw.githubusercontent.com/Nugine/simd/d74c030d9dc4f3cae02146d1f497ff62726ef09a/LICENSE'
    'oxc-notice-734d7fb3eb56f0a04e6b.txt::https://raw.githubusercontent.com/cloudwego/sonic-rs/41ae6e8a5962da26eab34432d1412f35ea6d199e/licenses/LICENSE-yyjson'
    'oxc-notice-7fb47d7306f9a3ba25b4.txt::https://raw.githubusercontent.com/oxc-project/fast-glob/3b6c31c39a676257fd1d95c338025b64f3f0395a/LICENSE'
    'oxc-notice-89461664ce2aee7d80ea.txt::https://raw.githubusercontent.com/Canop/lazy-regex/39a459c01e1ba2488075be50a821e2d72e466241/LICENSE'
    'oxc-notice-95ced5ecf1133fbf41d4.txt::https://raw.githubusercontent.com/oxc-project/oxc-index-vec/8e09fe324eb6df02f56e4eacdfac958930300380/LICENSE'
    'oxc-notice-b05785f9f18e6716bab6.txt::https://raw.githubusercontent.com/spdx/license-list-data/d46e94e2c78ceede1cfc63cfa0396472d2798d4c/text/MIT.txt'
    'oxc-notice-c71d239df91726fc519c.txt::https://raw.githubusercontent.com/cloudwego/sonic-rs/41ae6e8a5962da26eab34432d1412f35ea6d199e/licenses/LICENSE-sonic'
)
sha256sums=(
    '75b1902bcbb06d28111200d10af9ca1d8b1c968c6940d0a8a1263e67d7980792'
    '25fd9c2f251904b0ff5547c3b6023b22295028ebb33d436f2070dc395965fe1a'
    '7a6a453af08875e984ef1addb673122b0232bf3979c282435a96111e1183aa3f'
    '6f76ab18ae09ee637f89058bedafcf3c031f31e289922e78e23d83af9c3b4fba'
    'c95ef2e47f478d6d5fc2ef5a4e588e0ae0ea7548a8eacc38688d7072f62c4008'
    '4123d9e19553658e388a25e2377b4405dba4a80c98278c05da86977c19bb1f39'
    '5ccf5e89f69b80acbce09bff9a3a90ce38785b1c97b0eb25a6f3d33ec5a9f0c4'
    'ce4f5e9b1e49deb17675625d78c2a61f7c65b1e567de823655b69828f5da1b94'
    '477e2261909a160b34241229535d4bfaf3a1d024b1972ec2cf598451244851ed'
    '6bcc658a1e9893f499c69d3dcceb58b1f60433608593a389b3c31a9b0b5ae76e'
    'c474b8c6985a3b5eca0785be7b865112690148d67cda296b73699a118cc7183f'
    '38e6337dd7b58218269d38aab73dab3f5a6856387d2aa24b9e7b6cc72c4e6997'
    '0073dc4f1300d71a0eb6054d9b87e3d8862a734c9e07970c711f6e3e16495a51'
    '870dee83b650c48e2f715da5b8fb634de598f9ad624a7736d7a55b59161b282b'
    '4ec754cd4927cd7d780fa09ba431e2faa7bc046f41dd43723576651912fdff7e'
    '7b47e19e9eaa6241d374ad1fcf03726b450b94db5142071e06db1e177b8edc9b'
    '6d25c12c6c513051ea4e25564c64613c8773dd2c3618e9b448fe40f946d3d920'
    '98aca09b6a625fa70683db185a32c31d566a959917a1ad31163a2dee29a6e56c'
    '7a1064a080ba9fdacb479f508c4e3dc5ed74cf4f20118d897c71bda345cb263c'
    '0222f09e02cbc80258de6e9d88e77ecee1374c1116c161549fc275090f4b972f'
    'a546bf0c9ebb692955f2f9bec1d50892316f1b641fcc4cefe7d9d204bca05e6d'
    'eb14838c385bdedb785304c46c5b8c624ea052e7b002a86020337a1637907426'
    '9b2ed54f794d3f5f74f675b15ced161f9cb7e4e2ea000ed5eccb55c75e2bac67'
    'd4d9d8becea986a1ae8960ec5989c6917347adcdcbd83b2e5d4f817f0c61d133'
    '8483c9a8c4b24b1c146302e2e02f77692ae58e5e261b2fa41b801118da7b0be0'
    'a7407ddb198ac873e4326e54b86b91f563fdaed38f53af13aa90b6ff574ea310'
    '44bd74ac6d123bcad17d71158b42a7bc9a399d789c6280a55e251309e4e05ff8'
    '9ffd545db6ea61f2705c5cd9cc418cd7be0d02be6513c9ae725fc29d659f99a8'
    '8fbe28a025d89f845f99418acf96db90ac91281487fd7fe3d976f4cb4873e439'
    'dda13adc57bda7cad293b5592a4e050b1f02b85dccb5a315a0dd88080eeea716'
    '0e80a2d229d2fd4fc7e8636142ec5d0ff0bc031f14c15b682e2ac01dfd5b5138'
    'cb992262f361a5359e6771c28740d33c7041e15332ae8537fae40538992591a9'
    '34dee5fd5e5cc756efb5ad4d64652bce719bdf5e900ca5d7538253e737930bc4'
    '3a850fa5f08101db6f40676c2786e10bd2cd5fff7b12ffdf1e0c434d4e49d90c'
    'cb992262f361a5359e6771c28740d33c7041e15332ae8537fae40538992591a9'
    'a79aae0c0f21990d9d963bb3c5a79cdcea9a46f8523ba55c58d7fe776b6ebc84'
    'b05785f9f18e6716bab63424b11454513b9943a222595b70411009202fc592b5'
    'f32fb3b417a194167cfad068223fc975ba96c5960513a10f66a3c28720aec1df'
    '1ffe382325000cf1e9a416d711a24d0256ea26e06daa00f32aa72c32d76df7d9'
    '5b893305a717230e5b0024ff5ca3eec1dc05ba600c9b140730488d97ce56f1e6'
    'b05785f9f18e6716bab63424b11454513b9943a222595b70411009202fc592b5'
    '074e6e32c86a4c0ef8b3ed25b721ca23aca83df277cd88106ef7177c354615ff'
    'a2010f343487d3f7618affe54f789f5487602331c0a8d03f49e9a7c547cf0499'
    'b05785f9f18e6716bab63424b11454513b9943a222595b70411009202fc592b5'
    'c06b587892173a82f6d923ce24bcefd49d2b4dd18f36afe2dc06b3aea1e6af76'
    'e078ab4217332db9ac446cdf23e932eabd21d6db7c239a6495df4d3802251f20'
    'a568830569a01ce0075873bba1637dc2b188939b87b11eb63a20df7cc3460e13'
    'c07421d0e2622fb095e3ef334c23edf8fdf9d06960aec571f0fbe47ae9d90d42'
    '9e700233b65df166274d89f914e1df2a52dc579ff812672bda8a20c7c0877ddc'
    '328efe7c8b370c990ca3136a59ae865d682c106df18f6d4d79cec9e8a2521011'
    '1239e7c6132a67a3e9dffb8debe00de420d1887c4f24dc9dc8ad162ee16d909c'
    '1a6b0423beac129f25e7628e117bb289f076d8bf83be1959746c16fb2c5d9d84'
    '04fdda122c861e54a64ed03a929e6914b2b960c3b47996b7f8da8299bdc780f0'
    '2983ca061220c0de4474301ad813a622b41ad4ec21512b40de58f6f196ddbc65'
    'd2b9377ec7a4a9423b5b4a1c7ed9b46f44fe799168abd5075dfd7e72aef03519'
    '20538257cfb1812d48164a7d11c0008a66b33c01b4debdfa0ec2a104fe00f028'
    '23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3'
    '3f1ce66533302df3a32edbfdfc0b78f0dd34659e4c1f5817162e5ea3c2297215'
    '43070e2d4e532684de521b885f385d0841030efa2b1a20bafb76133a5e1379c1'
    '43293fded4890ea79c7ec12e41c644524063cac78f44ab52c4deba169fc4c13f'
    '5c932d88256b4ab958f64a856fa48e8bd1f55bc1d96b8149c65689e0c61789d3'
    '62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a'
    '664f4e8a5ae846b8a94960da2418187c0b4176d64266ba5fdb8316a8ddf50f27'
    '6fb8065469e053e7193bd6a82616740b2819725fbd12a027aa99534643247cca'
    '71674605ec4c087fe9eb534e3e4f9e26eb2e4aabcd76a29fd156c6a844d44b3d'
    '734d7fb3eb56f0a04e6b7ab0c5d3634624a8bfaa2acc87a2c03a029b20868cf8'
    '7fb47d7306f9a3ba25b44e7b9a94a300548a46709ed27753e28deac8e868b1cd'
    '89461664ce2aee7d80ea8fba7118fe7abd490d76ba435cf1d81d3128e060711f'
    '95ced5ecf1133fbf41d409b5555c86c344f83f3b019926057ddbc07cfdcc27b3'
    'b05785f9f18e6716bab63424b11454513b9943a222595b70411009202fc592b5'
    'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4'
)

prepare() {
    # AUR limits individual files to 500 kB. Reassemble the exact reviewed lock.
    cat "$srcdir/docs-ui-swagger-package-lock.json.part1" \
        "$srcdir/docs-ui-swagger-package-lock.json.part2" > "$srcdir/docs-ui-swagger-package-lock.json"
    printf '%s  %s\n' 'bbfff7584a71e1775f8aef0a20efb983adcf70b8f1bf9376206c648f509e194d' "$srcdir/docs-ui-swagger-package-lock.json" | sha256sum -c -
    cd "$_source"
    patch -Np1 --fuzz=0 -i "$srcdir/arch-torchvision-pair.patch"
    # Arch supplies the build backend; retain the upstream feature floors
    # without requiring its exact bootstrap patch versions.
    sed -i 's/setuptools==84.1.0/setuptools>=84.1.0/' pyproject.toml
    sed -i 's/setuptools-scm==9.2.2/setuptools-scm>=9.2.2/' pyproject.toml
    # New upstream source already excludes its test and node_modules trees.
    # Validate the retained compatibility suites against Arch's current stack.
    # These widened bounds are a candidate compatibility trial, never proof by
    # metadata alone. CPU and real GPU functional gates are required.
    sed -i 's/<=5.17.0/<6/g; s/<5.0.0/<6/g; s/torch>=2.4.0,<2.15.0/torch>=2.4.0,<2.16.0/g' pyproject.toml
    # The upstream TRL tuple-availability correction now includes the former
    # local trl-import-utils-compat.patch implementation.
    cp "$srcdir/frontend-runtime-inventory.ts" "$srcdir/frontend-vite.config.ts" studio/frontend/
    python - <<'PY'
from pathlib import Path
p = Path('pyproject.toml')
s = p.read_text()
needle = '"studio" = [\n'
assert s.count(needle) == 1
s = s.replace(needle, needle + ''.join(
    f'    "frontend/{name}",\n' for name in (
        'frontend-runtime-inventory.ts', 'frontend-vite.config.ts',
        '.runtime-modules.json', '.source-built-components.json',
    )
))
p.write_text(s)
PY
    # Fetch pinned Cargo sources before the offline native build. No shared
    # Cargo home or prebuilt npm native module enters the package.
    export CARGO_HOME="$srcdir/oxc-cargo-cache"
    local oxc_root
    for oxc_root in \
        "$srcdir/oxc-73e6b564737a29ecebf428d276421dcc492836df" \
        "$srcdir/oxc-07ed78f4abde4020ca7919381ffea4da8616b78a"; do
        cargo fetch --locked --manifest-path "$oxc_root/Cargo.toml"
    done
}

build() {
    cd "$_source"
    # Rebuild the complete Studio browser client from its locked source tree.
    export npm_config_cache="$srcdir/npm-cache" npm_config_audit=false npm_config_fund=false
    cd studio/frontend
    npm ci --ignore-scripts --no-audit --no-fund
    python "$srcdir/frontend-source-build.py" "$srcdir" "$PWD"
    npm run build -- --config frontend-vite.config.ts
    python "$srcdir/frontend-notices.py" "$PWD" "$srcdir"
    cd "$srcdir/$_source"
    python "$srcdir/docs-ui-source-build.py" "$srcdir" "$PWD"
    python "$srcdir/docs-ui-notices.py" "$PWD/studio/frontend" "$srcdir"
    python "$srcdir/oxc-source-build.py" "$srcdir" "$PWD"
    python "$srcdir/packaging-studio-assets.py" configure "$PWD"
    python -m build --wheel --no-isolation
}

check() {
    # Node test fixtures must resolve the frontend source directory relative
    # to their module, because makepkg itself also builds below a src directory.
    # Keep every case and assertion, and verify each exact upstream input.
    python - "$srcdir/$_source" <<'PYFIXTURES'
from pathlib import Path
import hashlib, sys
root = Path(sys.argv[1])
changes = [{'path': 'studio/frontend/tests/helpers/vite-env-loader.mjs', 'before_sha256': 'b69f78749189e7b45584a2c1a6aef2e9a63208607079f7fc0985eaeee793c813', 'after_sha256': '305f8ac561f583c9f52f9b0ed11ae9a9396252d134d4a33e3e30ab4b2fa120b4', 'changes': [{'before': 'export async function load(url, context, next) {', 'after': 'const sourceRoot = new URL("../../src/", import.meta.url).href;\n\nexport async function load(url, context, next) {'}, {'before': 'if (!url.includes("/src/") || result.source === undefined) return result;', 'after': 'if (!url.startsWith(sourceRoot) || result.source == null) return result;'}], 'test_declarations_unchanged': 0, 'assertion_calls_unchanged': 0}, {'path': 'studio/frontend/tests/desktop-stop-intent.test.ts', 'before_sha256': 'aa7aac7a25f4a895d602d806db75118be1c990cb1950ec664f1de7c342b3ae95', 'after_sha256': '0af55024e9a30c1a8f2c894851a700a14228c5f58d13ded9cbfc811bc7c84ab6', 'changes': [{'before': 'owners.map((f) => f.slice(f.indexOf("/src/"))),', 'after': 'owners.map((f) => "/src/" + f.slice(new URL("../src/", import.meta.url).pathname.length)),'}], 'test_declarations_unchanged': 12, 'assertion_calls_unchanged': 27}, {'path': 'studio/frontend/tests/low-disk-cache-notice.test.ts', 'before_sha256': '51fffa97cddf70d389cd6ee009c11d942d370e8629a24d1545884cd4e15aa1a7', 'after_sha256': '0a77c6778ceca9255c80f03fc9706e1b8422a4fa4ebb226afee6aa39b3714538', 'changes': [{'before': 'callers.map((file) => file.pathname.split("/src/")[1]),', 'after': 'callers.map((file) => file.pathname.slice(new URL("../src/", import.meta.url).pathname.length)),'}], 'test_declarations_unchanged': 26, 'assertion_calls_unchanged': 80}]
for row in changes:
    path = root / row['path']
    data = path.read_text()
    digest = hashlib.sha256(data.encode()).hexdigest()
    if digest == row['after_sha256']:
        continue
    assert digest == row['before_sha256'], row['path']
    for change in row['changes']:
        assert data.count(change['before']) == 1, row['path']
        data = data.replace(change['before'], change['after'])
    assert hashlib.sha256(data.encode()).hexdigest() == row['after_sha256']
    path.write_text(data)
PYFIXTURES
    node "$srcdir/packaging-check-docs-ui.mjs" \
        "$srcdir/$_source/studio/backend/assets/docs_ui" "$srcdir/docs-ui-browser-check"
    (cd "$srcdir/$_source/studio/frontend" && npm test)
    (cd "$srcdir/$_source" && python -m pytest --noconftest -q --tb=short \
        studio/backend/tests/test_docs_ui_assets.py)
    # Verify every rebuilt browser/native asset and original notice, the
    # exact three native bindings, wheel platform tag and recorded bytes.
    python "$srcdir/packaging-studio-assets.py" verify "$srcdir/$_source"
    local test_root="$srcdir/test-install"
    local test_home="$srcdir/test-home"
    local pytest_tmp="$srcdir/pytest-tmp"
    rm -rf "$test_root" "$test_home" "$pytest_tmp"
    mkdir -p "$test_home" "$pytest_tmp"
    python -m installer --destdir="$test_root" \
        "$srcdir/$_source"/dist/*.whl
    local site_packages
    site_packages=$(python -c 'import site; print(site.getsitepackages()[0])')
    local staged="$test_root$site_packages"
    python "$srcdir/packaging-studio-assets.py" restore-link "$staged"
    PYTHONPATH="$staged" python -P "$srcdir/packaging-check-oxc.py" \
        --prefix "$test_root" --source-root "$srcdir" --output "$srcdir/oxc-check"
    PYTHONPATH="$staged" python -P "$srcdir/packaging-check-studio-service.py" \
        --prefix "$test_root" --output "$srcdir/studio-service-check"

    export CUDA_VISIBLE_DEVICES=
    export ROCR_VISIBLE_DEVICES=
    export HIP_VISIBLE_DEVICES=
    export HF_HUB_OFFLINE=1
    export TRANSFORMERS_OFFLINE=1
    export HF_DATASETS_OFFLINE=1
    export UNSLOTH_ALLOW_CPU=1
    export UNSLOTH_COMPILE_DISABLE=1
    export TORCHDYNAMO_DISABLE=1
    export TORCH_COMPILE_DISABLE=1
    export PROTOCOL_BUFFERS_PYTHON_IMPLEMENTATION=python
    export HOME="$test_home"
    export PYTHONPATH="$staged:$srcdir/$_source/studio"

    cd "$_source"

    # Representative upstream CPU checks for current dependency imports,
    # packed attention and export dispatch. GPU kernels and Studio service
    # tests are outside this check; tiny-model trainer tests follow below.
    python -P -m pytest -q --tb=short \
        --basetemp="$pytest_tmp/compat" \
        --disable-socket --allow-hosts=127.0.0.1,localhost,::1 \
        tests/python/test_fast_language_model_text_only.py \
        tests/utils/test_attention_masks.py \
        tests/vllm_compat/test_unsloth_zoo_imports.py \
        tests/saving/test_export_api_surface.py \
        tests/saving/test_export_dispatch.py \
        --deselect 'tests/utils/test_attention_masks.py::test_run_attention_flash_varlen_receives_window_and_softcap'

    # These upstream tests supply their own CPU accelerator harness. The
    # general CI flag disables the very trainer rewriting they check, so run
    # them separately without that flag. Allow their small model fixture.
    env -u UNSLOTH_ALLOW_CPU HF_HUB_OFFLINE=0 TRANSFORMERS_OFFLINE=0 \
        HF_DATASETS_OFFLINE=0 python -P -m pytest -q --tb=short \
        --basetemp="$pytest_tmp/trainers" \
        tests/version_compat/test_trl_fake_train_cpu.py \
        tests/version_compat/test_trl_grpo_fake_run.py

    # Exercise the staged wheel and packaged command outside the checkout.
    cd "$srcdir"
    PKGVER="$pkgver" TEST_ROOT="$test_root" \
        CPU_HARNESS="$srcdir/$_source/tests/conftest.py" \
        python -P - <<'PY'
import importlib.util
from importlib.metadata import version
import json
from pathlib import Path
import os
import subprocess
import tempfile

# Use upstream's own CPU-only import harness. It only replaces accelerator
# probes; the attention operation below still runs on real CPU tensors.
# The suite-wide CI flag intentionally suppresses TRL rewriting. Remove it
# only in this child so the staged wheel follows the normal user import path.
os.environ.pop("UNSLOTH_ALLOW_CPU", None)
spec = importlib.util.spec_from_file_location(
    "unsloth_cpu_harness", os.environ["CPU_HARNESS"]
)
cpu_harness = importlib.util.module_from_spec(spec)
spec.loader.exec_module(cpu_harness)

import torch
import unsloth
from trl import GRPOConfig as top_config
from trl.trainer import GRPOConfig as trainer_config
from trl.trainer.grpo_config import GRPOConfig as config_module_config
from trl.trainer.grpo_trainer import GRPOConfig as trainer_module_config
from unsloth.utils import AttentionConfig, AttentionContext, SDPA, run_attention

assert version("unsloth") == unsloth.__version__ == os.environ["PKGVER"]
assert Path(unsloth.__file__).resolve().is_relative_to(
    Path(os.environ["TEST_ROOT"]).resolve()
)

# The upstream regression instantiates the patched GRPO config with its
# implicit GPU precision. Retain its identity and augmentation checks while
# explicitly selecting the CPU mode required by Transformers 5.12.
assert top_config is trainer_config
assert top_config is trainer_module_config
assert top_config is config_module_config
with tempfile.TemporaryDirectory() as config_tmp:
    args = config_module_config(output_dir=config_tmp, use_cpu=True)
assert args.unsloth_grpo_mini_batch is None

# Exercise the public packed-attention dispatcher used during fine-tuning.
lengths = torch.tensor([2, 2], dtype=torch.int32)
cu_seqlens = torch.tensor([0, 2, 4], dtype=torch.int32)
config = AttentionConfig(backend=SDPA, n_kv_heads=1, n_groups=1)
context = AttentionContext(
    bsz=1,
    q_len=4,
    kv_seq_len=4,
    n_heads=1,
    head_dim=1,
    requires_grad=False,
    seq_info=(lengths, cu_seqlens, 2),
    attention_mask=None,
    causal_mask=None,
)
query = torch.zeros((1, 1, 4, 1), dtype=torch.float32)
key = torch.zeros_like(query)
value = torch.tensor([1.0, 3.0, 10.0, 14.0]).view(1, 1, 4, 1)
output = run_attention(config=config, context=context, Q=query, K=key, V=value)
torch.testing.assert_close(
    output.flatten(), torch.tensor([1.0, 2.0, 10.0, 12.0])
)

# Drive the packaged CLI through a normal checkpoint-discovery workflow.
with tempfile.TemporaryDirectory() as raw:
    studio_home = Path(raw) / "studio"
    run = (
        studio_home
        / "outputs"
        / "unsloth_Llama-3.2-3B-Instruct_1771227800"
    )
    checkpoint = run / "checkpoint-2"
    checkpoint.mkdir(parents=True)
    (run / "config.json").write_text(
        json.dumps({"_name_or_path": "unsloth/Llama-3.2-3B-Instruct"})
    )
    (checkpoint / "config.json").write_text("{}")
    (checkpoint / "trainer_state.json").write_text(
        json.dumps({"log_history": [{"loss": 0.125}]})
    )
    cli_env = dict(os.environ, UNSLOTH_STUDIO_HOME=str(studio_home))
    cli = Path(os.environ["TEST_ROOT"]) / "usr/bin/unsloth"
    result = subprocess.run(
        [str(cli), "list-checkpoints", "--outputs-dir", str(studio_home / "outputs")],
        check=True,
        capture_output=True,
        text=True,
        env=cli_env,
    )
    assert "checkpoint-2 (loss: 0.1250)" in result.stdout
PY
    UNSLOTH_ZOO_DISABLE_GPU_INIT=1 \
        "$test_root/usr/bin/unsloth" --help >/dev/null
}

package() {
    cd "$_source"
    python -m installer --destdir="$pkgdir" dist/*.whl
    local site_packages
    site_packages=$(python -c 'import site; print(site.getsitepackages()[0])')
    python "$srcdir/packaging-studio-assets.py" restore-link "$pkgdir$site_packages"
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
    cp -a studio/backend/core/data_recipe/oxc-validator/third-party-notices \
        "$pkgdir/usr/share/licenses/$pkgname/oxc"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 studio/LICENSE.AGPL-3.0 \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE.AGPL-3.0"
    cp -a studio/frontend/dist/third-party-notices \
        "$pkgdir/usr/share/licenses/$pkgname/frontend"
    install -Dm644 studio/backend/vendor/LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/truststore-LICENSE"
    install -Dm644 studio/backend/vendor/LICENSE.laya \
        "$pkgdir/usr/share/licenses/$pkgname/laya-LICENSE"
    local notice
    for notice in studio/backend/assets/docs_ui/LICENSE.* \
                  studio/backend/assets/docs_ui/NOTICE.* \
                  studio/backend/assets/docs_ui/*.LICENSE.txt; do
        install -Dm644 "$notice" \
            "$pkgdir/usr/share/licenses/$pkgname/docs-ui/${notice##*/}"
    done
    find "$pkgdir/usr/share/licenses/$pkgname" -type d -exec chmod 755 {} +
    find "$pkgdir/usr/share/licenses/$pkgname" -type f -exec chmod 644 {} +
}
